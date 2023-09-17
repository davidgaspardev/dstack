#include "dstack.h"

DStack* create_dstack() {
    DStack* dstack = (DStack*) malloc(sizeof(DStack));
    if (dstack == NULL) {
        return NULL;
    }

    dstack->top = NULL;
    dstack->size = 0;
    
    return dstack;
}

enum DStackStatus push(DStack* dstack, int info) {
    if (dstack == NULL) {
        return STACK_NULL;
    }
    
    DNode* new_top = (DNode*) malloc(sizeof(DNode));
    if (new_top == NULL) {
        return NODE_NULL;
    }
    
    new_top->info = info;
    new_top->prev = dstack->top;
    dstack->top = new_top;
    dstack->size++;

    return OK;
}

int pop(DStack* dstack) {
    if (dstack == NULL) {
        return STACK_NULL;
    }
    
    if (dstack->top == NULL) {
        return STACK_EMPTY;
    }
    
    DNode* old_top = dstack->top;
    int old_info = old_top->info;
    dstack->top = old_top->prev;
    dstack->size--;
    free(old_top);
    
    return old_info;
}

int top(DStack* dstack) {
    if (dstack == NULL) {
        return STACK_NULL;
    }
    
    if (dstack->top == NULL) {
        return STACK_EMPTY;
    }
    
    return dstack->top->info;
}

int size(DStack* dstack) {
    if (dstack == NULL) {
        return STACK_NULL;
    }
    
    return dstack->size;
}

bool is_empty(DStack* dstack) {
    if (dstack == NULL) {
        return NULL;
    }
    
    return dstack->top == NULL;
}

enum DStackStatus destroy(DStack* dstack) {
    if (dstack == NULL) {
        return STACK_NULL;
    }
    
    while (!is_empty(dstack)) {
        pop(dstack);
    }
    free(dstack);
    dstack = NULL;

    return OK;
}