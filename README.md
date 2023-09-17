# DStack

DStack is a dynamic stack data structure implemented in C. It allows for basic operations like push, pop, and peek, and is designed to be both efficient and easy to use.

## Features

- **Dynamic Growth**: No need to specify the stack size upfront. It will grow as needed.
- **Type Safety**: Uses int data type for simplicity. However, this can be easily modified for other data types.
- **Error Handling**: Returns special enumerated values for error cases such as null stack, empty stack, or node allocation failures.
- **Memory Management**: Proper allocation and deallocation functions to prevent memory leaks.

## Getting Started

### Prerequisites

A C compiler, preferably clang as specified in the project's Makefile. However, other compilers like gcc can also be used with minor modifications to the Makefile.

### Compilation

Clone the repository:

```bash
git clone https://github.com/davidgaspardev/dstack.git
cd dstack
```

Compile the project:

```bash
make build
```

Create a static library:

```bash
make library
```


Run tests:

```bash
make test
./bin/test
```

Cleanup
To clean the project (remove object files, binaries, and libraries):

```bash
make clean
```

## API Reference

- `DStack* create_dstack()`: Creates a new empty stack.
- `enum DStackStatus push(DStack* dstack, int info)`: Pushes a value onto the stack.
- `int pop(DStack* dstack)`: Pops a value from the stack.
- `int top(DStack* dstack)`: Peeks at the top value without popping.
- `int size(DStack* dstack)`: Returns the current size of the stack.
- `bool is_empty(DStack* dstack)`: Checks if the stack is empty.
- `enum DStackStatus destroy(DStack* dstack)`: Deallocates the stack and its contents.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is open source. Feel free to use, modify, and distribute as you see fit, but do so at your own risk.