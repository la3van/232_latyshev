#include <stdio.h>
#include <stdlib.h>

void reverse_array(int *arr, size_t size)
{
    if (arr == NULL || size == 0) {
        return;
    }
    
    for (size_t i = 0; i < size / 2; ++i) {
        int tmp = arr[i];
        arr[i] = arr[size - 1 - i];
        arr[size - 1 - i] = tmp;
    }
}


int main(void)
{
    size_t n;
    int *arr = NULL;
    scanf("%zu", &n);

    if (n > 0) {
        arr = malloc(n * sizeof *arr);
        for (size_t i = 0; i < n; ++i) {
            scanf("%d", &arr[i]);
        }
    }

    reverse_array(arr, n);

    for (size_t i = 0; i < n; ++i) {
        if (i + 1 == n) {
            printf("%d\n", arr[i]);
        } else {
            printf("%d ", arr[i]);
        }
    }

    free(arr);
}