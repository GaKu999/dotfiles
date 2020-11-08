// ${XDG_BIN_DIR}/.src/launchy.c
// vim:ft=c:fenc=utf-8:noet:ts=3:sw=3:

/* Signal controlled process launcher.
 *
 * Can be launched with 2 associated programs.
 * On signal:
 *	 USR1 - spawns the 1st.
 *  USR2 - spawns the 2nd, or does nothing.
 */

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <libgen.h>

#include <sys/stat.h>
#include <sys/wait.h> // pulls signal.h

#include <linux/limits.h>

static volatile int stopped = 0;

const static char *task;

const static char *alt_task;

static pid_t spawn(const char *prog, const int ec) {
	const pid_t pid = fork();

	if (pid < 0)
		exit(ec);
	else if (pid > 0)
		return pid;

	execlp(prog, prog, NULL);
	perror(prog);
	_exit(ec);
}

static int mktree(const char *path, const mode_t mode, const int is_file) {
	if (strcmp(path, "/") == 0)
		return EXIT_SUCCESS;

	struct stat st;

	if (stat(path, &st) < 0 || !S_ISDIR(st.st_mode)) {
		const char *parent = dirname(strdup(path));

		if (mktree(parent, mode, 0) < 0)
			return -1;

		if (!is_file)
			if (mkdir(path, mode) < 0)
				return -1;
	}

	return EXIT_SUCCESS;
}

void handler(const int sig) {
	switch(sig) {
	case SIGCHLD:
		wait(NULL);
		break;
	case SIGTERM:
		stopped = 1;
		break;
	case SIGUSR1:
		spawn(task, 2);
		break;
	case SIGUSR2:
		spawn(alt_task, 3);
		break;
	}
}

int main(const int argc, const char *argv[]) {
	const char *identifier;
	const char *pid_file_path;

	switch (argc) {
	case 4:
		alt_task = argv[3];
	case 3:
		task = argv[2];
		identifier = argv[1];
		break;
	default:
		puts("Usage: launchy ID TASK [ALT_TASK]");
		return EXIT_SUCCESS;
	}

	{
		FILE *pid_file;
		char path[PATH_MAX];
		const char *runtime_path;

		if ((runtime_path = getenv("XDG_RUNTIME_DIR")) == NULL) {
			fputs("launchy: XDG_RUNTIME_DIR: undefined environment variable", stderr);
			return EXIT_FAILURE;
		}

		snprintf(path, PATH_MAX, "%s/launchy/%s.pid", runtime_path, identifier);
		pid_file_path = strdup(path);
		mktree(pid_file_path, 0755, 1);

		if ((pid_file = fopen(pid_file_path, "w")) == NULL) {
			perror(pid_file_path);
			return EXIT_FAILURE;
		}

		fprintf(pid_file, "%d", getpid());
		fclose(pid_file);
	}

	struct sigaction sa;
	sa.sa_handler = handler;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = 0;
	sigaction(SIGCHLD, &sa, NULL);
	sigaction(SIGTERM, &sa, NULL);
	sigaction(SIGUSR1, &sa, NULL);

	if (alt_task != NULL)
		sigaction(SIGUSR2, &sa, NULL);
	else
		signal(SIGUSR2, SIG_IGN);

	while (!stopped)
		pause();

	remove(pid_file_path);

	return EXIT_SUCCESS;
}
