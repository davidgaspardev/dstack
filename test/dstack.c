#include <dstack.h>
#include <stdio.h>

int main() {
    DStack* dstack = create_dstack();

    int control, info;
    do {
        printf("Test menu\n");
        printf("[ 1 ] Add info\n");
        printf("[ 2 ] Exit\n");
        printf("Enter menu option: ");
        scanf("%d", &control);
        fflush(stdin);

        if (control == 1) {
            printf("Enter new info: ");
            scanf("%d", &info);
            fflush(stdin);

            switch(push(dstack, info)) {
                case STACK_NULL:
                    printf("[ ERR ] Stack is null");
                    dstack = create_dstack();
                default:;
            }
        }
    } while (control != 2);
    
    printf("[ OK ] Current peek: %d\n", peek(dstack));
    
    while(dstack->size > 0) {
        printf("[ OK ] Popped info: %d \n", pop(dstack));
    }

    destroy(dstack);
}