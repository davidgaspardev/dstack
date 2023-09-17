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

# Temporary directories
TMP_DIRECTORIES =    \
	$(OBJ_DIRECTORY) \
	$(BIN_DIRECTORY)

$(OBJ_DIRECTORY):
	@mkdir $@
	@echo "[ + ] Directory created: $@"

$(BIN_DIRECTORY):
	@mkdir $@
	@echo "[ + ] Directory created: $@"

# Variables for build
SOURCES = $(wildcard $(SRC_DIRECTORY)/*.c)
OBJECTS = $(patsubst $(SRC_DIRECTORY)/%.c, $(OBJ_DIRECTORY)/%.o, $(SOURCES))

$(OBJ_DIRECTORY)/%.o: $(OBJ_DIRECTORY) $(SRC_DIRECTORY)/%.c
	@$(CC) $(CFLAGS) $(word 2, $^) -o $@
	@echo "[ * ] Run: $(CC) $(CFLAGS) $(word 2, $^) -o $@"

.PHONY: show build

test: $(BIN_DIRECTORY) build
	@$(CC) $(CINCLUDES) $(TEST_DIRECTORY)/dstack.c -o $(BIN_DIRECTORY)/$@ $(OBJECTS)

build: $(OBJECTS)
	@echo "[ + ] BUILDED"

show:
	@echo "[ + ] Show variable from Makefile:"
	@echo "[ + ] SOURCES: $(SOURCES)"
	@echo "[ + ] OBJECTS: $(OBJECTS)"

clean:
	@$(foreach dir, $(TMP_DIRECTORIES), rm -rf $(dir))
	@echo "[ - ] Removed directories if they existed: $(TMP_DIRECTORIES)"