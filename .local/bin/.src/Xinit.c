// ${XDG_BIN_DIR}/.src/Xinit.c
// vim:ft=c:fenc=utf-8:noet:ts=3:sw=3:

/* Minimal X11 wrapper, using scripts in the user config dir.
 *
 * Structure:
 *  ${XDG_CONFIG_HOME}/X11/server
 *  ${XDG_CONFIG_HOME}/X11/client
 *  ${XDG_CONFIG_HOME}/X11/clean
 */

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/wait.h>

#include <linux/limits.h>

static volatile int running = 0;

static pid_t server(const char *prog) {
	const pid_t pid = fork();

	if (pid < 0)
		exit(2);
	else if (pid > 0)
		return pid;

	signal(SIGTTIN, SIG_IGN);
	signal(SIGTTOU, SIG_IGN);
	signal(SIGUSR1, SIG_IGN);

	execl(prog, prog, NULL);

	perror(prog);
	_exit(2);
}

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
	case SIGUSR1:
		running = 1;
		break;
	case SIGCHLD:
	case SIGTERM:
		running = 0;
		break;
	}
}

int main(const int argc, const char *argv[]) {
	const char *clean_prog;
	const char *client_prog;
	const char *server_prog;

	{
		char path[PATH_MAX];
		const char *config_path;

		if ((config_path = getenv("XDG_CONFIG_HOME")) == NULL) {
			const char *home_path;

			if ((home_path = getenv("HOME")) == NULL) {
				fputs("X11: HOME: undefined environment variable\n", stderr);
				return EXIT_FAILURE;
			}

			snprintf(path, PATH_MAX, "%s/.config", home_path);
			config_path = strdup(path);
		}

		snprintf(path, PATH_MAX, "%s/X11/clean", config_path);
		clean_prog = strdup(path);
		snprintf(path, PATH_MAX, "%s/X11/client", config_path);
		client_prog = strdup(path);
		snprintf(path, PATH_MAX, "%s/X11/server", config_path);
		server_prog = strdup(path);
	}

	struct sigaction sa;
	sa.sa_handler = handler;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = 0;
	sigaction(SIGCHLD, &sa, NULL);
	sigaction(SIGTERM, &sa, NULL);
	sigaction(SIGUSR1, &sa, NULL);

	freopen("/dev/null", "r", stdin);
	freopen("/dev/null", "w", stdout);
	freopen("/dev/null", "w", stderr);

	const pid_t spid = server(server_prog);

	while (!running)
		pause();

	const pid_t cpid = spawn(client_prog, 3);

	while (running)
		pause();

	waitpid(spawn(clean_prog, 4), NULL, 0);

	kill(cpid, SIGTERM);
	waitpid(cpid, NULL, 0);
	kill(spid, SIGTERM);
	waitpid(spid, NULL, 0);

	return EXIT_SUCCESS;
}
