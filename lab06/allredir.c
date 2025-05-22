#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    pid_t pid = fork();
    if (pid == 0) {
        int in_fd = open(argv[2], O_RDONLY);
        int out_fd = open(argv[3], O_CREAT | O_WRONLY | O_TRUNC, 0644);
        dup2(in_fd, STDIN_FILENO);
        dup2(out_fd, STDOUT_FILENO);
        close(in_fd);
        close(out_fd);
        execlp(argv[1], argv[1], (char *)NULL);
        exit(1);
    } else {
        int status;
        wait(&status);
        printf("received %d\n", WEXITSTATUS(status));
    }
    return 0;
}