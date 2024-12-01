# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -Wpedantic -O2 -std=c++17
LDFLAGS = -lm

# Directories
SRC_DIR = ../src
INC_DIR = ../include
BUILD_DIR = build

# Source and object files
SRC_FILES = $(wildcard $(SRC_DIR)/**/*.cpp)
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Output executable
EXEC = $(BUILD_DIR)/GhidraInject

# Rules
all: $(EXEC)

$(EXEC): $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

clean:
	rm -f $(OBJ_FILES) $(EXEC)

.PHONY: all clean
