#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int            data;
    struct Node   *next;
} Node;


static Node *push_front(Node **head, int value)
{
    Node *n = malloc(sizeof *n);
    n->data = value;
    n->next = *head;
    *head   = n;
    return n;
}


void reverse_list(Node **head)
{
    Node *prev = NULL, *cur = *head, *next;
    while (cur) {
        next      = cur->next;
        cur->next = prev;
        prev      = cur;
        cur       = next;
    }
    *head = prev;
}

static void free_list(Node *head)
{
    while (head) {
        Node *next = head->next;
        free(head);
        head = next;
    }
}
    
int main(void)
{
    Node *head = NULL;
    int x;
    while (scanf("%d", &x) == 1 && x != 0)
        push_front(&head, x);

    for (Node *n = head; n; n = n->next) {
        if (n->next) {
            printf("%d ", n->data);
        } else {
            printf("%d\n", n->data);
        }
    }

    free_list(head);
    return 0;
}