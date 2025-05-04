#include <stdio.h>
#include <stdlib.h>

int transpose_matrix(int **source_matrix, size_t rows, size_t cols, int ***dest_matrix_out)
{
    if (!dest_matrix_out) return -1;
    int **transposed = calloc(cols, sizeof *transposed);
    if (!transposed) return -1;

    for (size_t col_idx = 0; col_idx < cols; ++col_idx) {
        transposed[col_idx] = calloc(rows, sizeof **transposed);
        if (!transposed[col_idx]) {
            for (size_t prev_col = 0; prev_col < col_idx; ++prev_col)
                free(transposed[prev_col]);
            free(transposed);
            return -1;
        }
        for (size_t row_idx = 0; row_idx < rows; ++row_idx)
            transposed[col_idx][row_idx] = source_matrix[row_idx][col_idx];
    }
    *dest_matrix_out = transposed;
    return 0;
}

static void free_matrix(int **m, size_t rows)
{
    if (!m) return;
    for (size_t i = 0; i < rows; ++i)
        free(m[i]);
    free(m);
}

int main(void)
{
    size_t num_rows, num_cols;
    scanf("%zu %zu", &num_rows, &num_cols);

    if (num_rows == 0 || num_cols == 0) return 0;

    int **original_matrix = calloc(num_rows, sizeof *original_matrix);
    if (!original_matrix) return -1;

    for (size_t row = 0; row < num_rows; ++row) {
        original_matrix[row] = calloc(num_cols, sizeof **original_matrix);
        if (!original_matrix[row]) {
            free_matrix(original_matrix, row);
            return -1;
        }
        for (size_t col = 0; col < num_cols; ++col) {
            scanf("%d", &original_matrix[row][col]);
        }
    }

    int **transposed_matrix = NULL;
    if (transpose_matrix(original_matrix, num_rows, num_cols, &transposed_matrix) != 0) {
        free_matrix(original_matrix, num_rows);
        return -1;
    }

    for (size_t row = 0; row < num_cols; ++row) {
        for (size_t col = 0; col < num_rows; ++col)
            printf(col + 1 == num_rows ? "%d\n" : "%d ", transposed_matrix[row][col]);
    }

    free_matrix(transposed_matrix, num_cols);
    free_matrix(original_matrix, num_rows);
    return 0;
}