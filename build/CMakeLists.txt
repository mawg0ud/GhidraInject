cmake_minimum_required(VERSION 3.10)
project(GhidraFridaHookGen VERSION 1.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/include)

# Define the source files for the project
file(GLOB SOURCES 
    ${PROJECT_SOURCE_DIR}/src/*.cpp
    ${PROJECT_SOURCE_DIR}/src/ghidra_integration/*.cpp
    ${PROJECT_SOURCE_DIR}/src/frida_hooks/*.cpp
    ${PROJECT_SOURCE_DIR}/src/common/*.cpp
)

# Create an executable target
add_executable(GhidraFridaHookGen ${SOURCES})

# Set C++ compiler flags (for optimization, warnings, etc.)
target_compile_options(GhidraFridaHookGen PRIVATE
    -Wall -Wextra -Wpedantic
    -O2  # Optimization level
)

# Link external libraries if needed (e.g., Qt, Frida, etc.)
# find_package(Qt5 REQUIRED COMPONENTS Widgets Core)
# target_link_libraries(GhidraFridaHookGen Qt5::Widgets Qt5::Core)

# Add tests
enable_testing()
add_subdirectory(test)

# Installation rules
install(TARGETS GhidraFridaHookGen DESTINATION bin)
