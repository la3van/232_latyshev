#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    pid_t pid = fork();
    if (pid == 0) {
        int in = open(argv[1], O_RDONLY);
        int out = open(argv[2], O_CREAT | O_WRONLY | O_TRUNC, 0644);
        dup2(in, STDIN_FILENO);
        dup2(out, STDOUT_FILENO);
        close(in);
        close(out);
        execvp(argv[3], &argv[3]);
        exit(1);
    } else {
        int status;
        wait(&status);
        if (WIFEXITED(status)) {
            printf("received %d\n", WEXITSTATUS(status));
        }
    }

    return 0;
}
