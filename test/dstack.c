#include <dstack.h>
#include <stdio.h>

int main() {
    DStack* dstack = create_dstack();

    int info;
    for (int i = 0; i < 5; i++) {
        scanf("%d", &info);
        switch (push(dstack, info)) {
            case STACK_NULL:
                printf("stack is null\n");
                return 1;
            default:;
        }
    }
    
    printf("TOP: %d\n", top(dstack));
    
    while(dstack->size > 0) {
        printf("%d \n", pop(dstack));
    }

    destroy(dstack);
}