# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/shared/v8_app/app1/build/cmake

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/shared/v8_app/app1/out

# Include any dependencies generated for this target.
include CMakeFiles/hello.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hello.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello.dir/flags.make

CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o: CMakeFiles/hello.dir/flags.make
CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o: /root/shared/v8_app/app1/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/shared/v8_app/app1/out/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o -c /root/shared/v8_app/app1/src/main.cpp

CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/shared/v8_app/app1/src/main.cpp > CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.i

CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/shared/v8_app/app1/src/main.cpp -o CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.s

CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.requires:

.PHONY : CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.requires

CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.provides: CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/hello.dir/build.make CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.provides.build
.PHONY : CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.provides

CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.provides.build: CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o


# Object files for target hello
hello_OBJECTS = \
"CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o"

# External object files for target hello
hello_EXTERNAL_OBJECTS =

obj/hello: CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o
obj/hello: CMakeFiles/hello.dir/build.make
obj/hello: CMakeFiles/hello.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/shared/v8_app/app1/out/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable obj/hello"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello.dir/build: obj/hello

.PHONY : CMakeFiles/hello.dir/build

CMakeFiles/hello.dir/requires: CMakeFiles/hello.dir/root/shared/v8_app/app1/src/main.cpp.o.requires

.PHONY : CMakeFiles/hello.dir/requires

CMakeFiles/hello.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello.dir/clean

CMakeFiles/hello.dir/depend:
	cd /root/shared/v8_app/app1/out && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/shared/v8_app/app1/build/cmake /root/shared/v8_app/app1/build/cmake /root/shared/v8_app/app1/out /root/shared/v8_app/app1/out /root/shared/v8_app/app1/out/CMakeFiles/hello.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello.dir/depend
