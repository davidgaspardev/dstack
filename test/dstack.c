#include <dstack.h>

int main() {
    DStack* dstack = create_dstack();

    push(dstack, 10);

    destroy(dstack);
}