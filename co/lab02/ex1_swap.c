#include <stdio.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int x, y;

    printf("Enter two integers:\n");
    scanf("%d %d", &x, &y);

    swap(&x, &y);

    printf("%d %d\n", x, y);

    return 0;
}
