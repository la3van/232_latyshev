#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    int pipefd[2];
    if (pipe(pipefd) < 0) {
        perror("pipe");
        exit(1);
    }
    pid_t pid1 = fork();
    if (pid1 < 0) {
        perror("fork1");
        exit(1);
    }
    if (pid1 == 0) {
        if (dup2(pipefd[1], STDOUT_FILENO) < 0) {
            perror("dup2 in first child");
            exit(1);
        }
        close(pipefd[0]);
        close(pipefd[1]);
        execlp(argv[1], argv[1], (char *)NULL);
        perror("exec command1");
        exit(1);
    }
    pid_t pid2 = fork();
    if (pid2 < 0) {
        perror("fork2");
        exit(1);
    }
    if (pid2 == 0) {
        if (dup2(pipefd[0], STDIN_FILENO) < 0) {
            perror("dup2 in second child");
            exit(1);
        }
        close(pipefd[1]);
        close(pipefd[0]);
        execvp(argv[2], &argv[2]);
        perror("exec command2");
        exit(1);
    }
    close(pipefd[0]);
    close(pipefd[1]);

    int status;
    int exited1 = 0, exited2 = 0;
    while ((wait(&status)) > 0) {
        if (WIFEXITED(status)) {
            printf("child exited with %d\n", WEXITSTATUS(status));
        }
    }
    if (errno != ECHILD) {
        perror("wait");
        exit(1);
    }
    return 0;
}
