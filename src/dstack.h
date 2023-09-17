#ifndef DSTACK_H_
#define DSTACK_H_

#include <stdlib.h>
#include <stdbool.h>

typedef struct node {
    int info;
    struct node* prev;
} DNode;

typedef struct dstack {
    DNode* top;
    int size;
} DStack;

enum DStackStatus {
    OK          = 0,
    STACK_NULL  = -1,
    STACK_EMPTY = -2,
    NODE_NULL   = -3
};

DStack* create_dstack();
enum DStackStatus push(DStack* dstack, int info);
int pop(DStack* dstack);
int peek(DStack* dstack);
int size(DStack* dstack);
bool is_empty(DStack* dstack);
enum DStackStatus destroy(DStack* dstack);

#endif