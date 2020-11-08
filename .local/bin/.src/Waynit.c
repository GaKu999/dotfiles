// ${XDG_BIN_DIR}/.src/Waynit.c
// vim:ft=c:fenc=utf-8:noet:ts=3:sw=3:

/* Minimal Wayland wrapper, using scripts in the user config dir.
 *
 * Structure:
 *  ${XDG_CONFIG_HOME}/Wayland/compositor
 *  ${XDG_CONFIG_HOME}/Wayland/clean
 */

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/wait.h>

#include <linux/limits.h>

static volatile int stopped = 0;

static pid_t spawn(const char *prog, const int ec) {
	const pid_t pid = fork();

	if (pid < 0)
		exit(ec);
	else if (pid > 0)
		return pid;

	execl(prog, prog, NULL);

	perror(prog);
	_exit(ec);
}

void handler(const int sig) {
	switch(sig) {
	case SIGCHLD:
	case SIGTERM:
		stopped = 1;
		break;
	}
}

int main(const int argc, const char *argv[]) {
	const char *clean_prog;
	const char *compositor_prog;

	{
		char path[PATH_MAX];
		const char *config_path;

		if ((config_path = getenv("XDG_CONFIG_HOME")) == NULL) {
			const char *home_path;

			if ((home_path = getenv("HOME")) == NULL) {
				fputs("Wayland: HOME: undefined environment variable\n", stderr);
				return EXIT_FAILURE;
			}

			snprintf(path, PATH_MAX, "%s/.config", home_path);
			config_path = strdup(path);
		}

		snprintf(path, PATH_MAX, "%s/Wayland/clean", config_path);
		clean_prog = strdup(path);
		snprintf(path, PATH_MAX, "%s/Wayland/compositor", config_path);
		compositor_prog = strdup(path);
	}

	struct sigaction sa;
	sa.sa_handler = handler;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = 0;
	sigaction(SIGCHLD, &sa, NULL);
	sigaction(SIGTERM, &sa, NULL);

	freopen("/dev/null", "r", stdin);
	freopen("/dev/null", "w", stdout);
	freopen("/dev/null", "w", stderr);

	const pid_t cpid = spawn(compositor_prog, 2);

	while (!stopped)
		pause();

	waitpid(spawn(clean_prog, 3), NULL, 0);

	kill(cpid, SIGTERM);
	waitpid(cpid, NULL, 0);

	return EXIT_SUCCESS;
}
