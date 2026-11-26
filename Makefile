# Compilers
CC  = gcc
CXX = g++

# Include directories
INCLUDES = -Iinclude \
		   -ICore/Middleware/FreeRTOS \
           -ICore/Middleware/FreeRTOS/Source/include \
           -ICore/Middleware/FreeRTOS/Source/portable/MSVC-MingW

# Compiler flags
CFLAGS   = -std=c11 -Wall -Wextra -g $(INCLUDES)
CXXFLAGS = -std=c++17 -Wall -Wextra -g $(INCLUDES)

# Libraries (winmm: multimedia timer API used by the FreeRTOS MSVC-MingW port)
LDLIBS   = -lwinmm

# Source files
CPP_SRCS = $(wildcard Core/App/*.cpp)

C_SRCS += $(wildcard Core/Middleware/FreeRTOS/*.c)
C_SRCS += $(wildcard Core/Middleware/FreeRTOS/Source/*.c)
C_SRCS += $(wildcard Core/Middleware/FreeRTOS/Source/portable/MSVC-MingW/*.c)
C_SRCS += Core/Middleware/FreeRTOS/Source/portable/MemMang/heap_4.c

# Object files
CPP_OBJS = $(patsubst %.cpp,build/%.o,$(CPP_SRCS))
C_OBJS   = $(patsubst %.c,build/%.o,$(C_SRCS))

OBJS = $(CPP_OBJS) $(C_OBJS)

# Executable
TARGET = build/RobotSimulator.exe

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDLIBS)

# C compilation
build/%.o: %.c
	@if not exist "$(subst /,\,$(@D))" mkdir "$(subst /,\,$(@D))"
	$(CC) $(CFLAGS) -c $< -o $@

# C++ compilation
build/%.o: %.cpp
	@if not exist "$(subst /,\,$(@D))" mkdir "$(subst /,\,$(@D))"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean
clean:
	@if exist build rmdir /s /q build

.PHONY: all clean