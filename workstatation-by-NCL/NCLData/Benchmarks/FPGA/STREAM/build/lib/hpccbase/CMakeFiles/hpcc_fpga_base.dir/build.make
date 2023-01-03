# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/2UB102/HPCC_FPGA-master/STREAM

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/2UB102/HPCC_FPGA-master/STREAM/build

# Include any dependencies generated for this target.
include lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/compiler_depend.make

# Include the progress variables for this target.
include lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/progress.make

# Include the compile flags for this target's objects.
include lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/flags.make

lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o: lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/flags.make
lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o: /mnt/2UB102/HPCC_FPGA-master/shared/setup/fpga_setup.cpp
lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o: lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o -MF CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o.d -o CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o -c /mnt/2UB102/HPCC_FPGA-master/shared/setup/fpga_setup.cpp

lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.i"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/2UB102/HPCC_FPGA-master/shared/setup/fpga_setup.cpp > CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.i

lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.s"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/2UB102/HPCC_FPGA-master/shared/setup/fpga_setup.cpp -o CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.s

# Object files for target hpcc_fpga_base
hpcc_fpga_base_OBJECTS = \
"CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o"

# External object files for target hpcc_fpga_base
hpcc_fpga_base_EXTERNAL_OBJECTS =

lib/hpccbase/libhpcc_fpga_base.a: lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/setup/fpga_setup.cpp.o
lib/hpccbase/libhpcc_fpga_base.a: lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/build.make
lib/hpccbase/libhpcc_fpga_base.a: lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libhpcc_fpga_base.a"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase && $(CMAKE_COMMAND) -P CMakeFiles/hpcc_fpga_base.dir/cmake_clean_target.cmake
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hpcc_fpga_base.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/build: lib/hpccbase/libhpcc_fpga_base.a
.PHONY : lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/build

lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/clean:
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase && $(CMAKE_COMMAND) -P CMakeFiles/hpcc_fpga_base.dir/cmake_clean.cmake
.PHONY : lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/clean

lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/depend:
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/2UB102/HPCC_FPGA-master/STREAM /mnt/2UB102/HPCC_FPGA-master/shared /mnt/2UB102/HPCC_FPGA-master/STREAM/build /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase /mnt/2UB102/HPCC_FPGA-master/STREAM/build/lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/hpccbase/CMakeFiles/hpcc_fpga_base.dir/depend
