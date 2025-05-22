#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <errno.h>

int main(int argc, char *argv[]) {

    int in = open(argv[1], O_RDONLY);
    if (in < 0) {
        perror("open input");
        exit(1);
    }

    int out = open(argv[2], O_CREAT | O_WRONLY | O_TRUNC, 0644);
    if (out < 0) {
        perror("open output");
        exit(1);
    }

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        exit(1);
    }

    if (pid == 0) {
        if (dup2(in, STDIN_FILENO) < 0) {
            perror("dup2 input");
            exit(1);
        }
        if (dup2(out, STDOUT_FILENO) < 0) {
            perror("dup2 output");
            exit(1);
        }

        close(in);
        close(out);

        execvp(argv[3], &argv[3]);
        perror("execvp");
        exit(1);
    } else {
        close(in);
        close(out);

        int status;
        if (waitpid(pid, &status, 0) < 0) {
            perror("waitpid");
            exit(1);
        }

        if (WIFEXITED(status)) {
            printf("received %d\n", WEXITSTATUS(status));
        }
    }

    return 0;
}
