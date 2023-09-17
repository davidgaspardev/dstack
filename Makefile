NAME = dstack

# Compiler setup
CC = clang
CFLAGS = -c -Wall
CINCLUDES = -Isrc

# Directories
TEST_DIRECTORY = test
SRC_DIRECTORY = src
OBJ_DIRECTORY = obj
BIN_DIRECTORY = bin
LIB_DIRECTORY = lib

# Temporary directories
TMP_DIRECTORIES =    \
	$(OBJ_DIRECTORY) \
	$(BIN_DIRECTORY) \
	$(LIB_DIRECTORY)

$(OBJ_DIRECTORY):
	@mkdir $@
	@echo "[ + ] Directory created: $@"

$(BIN_DIRECTORY):
	@mkdir $@
	@echo "[ + ] Directory created: $@"

$(LIB_DIRECTORY):
	@mkdir $@
	@echo "[ + ] Directory created: $@"

# Variables for build
SOURCES = $(wildcard $(SRC_DIRECTORY)/*.c)
OBJECTS = $(patsubst $(SRC_DIRECTORY)/%.c, $(OBJ_DIRECTORY)/%.o, $(SOURCES))

$(OBJ_DIRECTORY)/%.o: $(OBJ_DIRECTORY) $(SRC_DIRECTORY)/%.c
	@$(CC) $(CFLAGS) $(word 2, $^) -o $@
	@echo "[ * ] Run: $(CC) $(CFLAGS) $(word 2, $^) -o $@"

.PHONY: show build

build: $(OBJECTS)
	@echo "[ + ] BUILDED"

library: $(LIB_DIRECTORY) build
	@ar -rc $(LIB_DIRECTORY)/lib$(NAME).a $(OBJ_DIRECTORY)/$(NAME).o
	@echo "[ + ] Static library created: lib$(NAME).a"

test: $(BIN_DIRECTORY) build
	@$(CC) $(CINCLUDES) $(TEST_DIRECTORY)/dstack.c -o $(BIN_DIRECTORY)/$@ $(OBJECTS)

show:
	@echo "[ + ] Show variable from Makefile:"
	@echo "[ + ] SOURCES: $(SOURCES)"
	@echo "[ + ] OBJECTS: $(OBJECTS)"

clean:
	@$(foreach dir, $(TMP_DIRECTORIES), rm -rf $(dir))
	@echo "[ - ] Removed directories if they existed: $(TMP_DIRECTORIES)"