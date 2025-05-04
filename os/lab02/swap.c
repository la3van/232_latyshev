#include <stdio.h>
#include <stdlib.h>

void swap_ints(int *a, int *b)
{
    if (!a || !b || a == b)
        return;

    int tmp = *a;
    *a      = *b;
    *b      = tmp;
}


int main(void)
{
    int x, y;
    scanf("%d %d", &x, &y);
    swap_ints(&x, &y);
    printf("%d %d\n", x, y);
}

