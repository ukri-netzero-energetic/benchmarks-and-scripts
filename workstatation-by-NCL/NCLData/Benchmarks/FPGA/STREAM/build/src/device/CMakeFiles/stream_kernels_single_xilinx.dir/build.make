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

# Utility rule file for stream_kernels_single_xilinx.

# Include any custom commands dependencies for this target.
include src/device/CMakeFiles/stream_kernels_single_xilinx.dir/compiler_depend.make

# Include the progress variables for this target.
include src/device/CMakeFiles/stream_kernels_single_xilinx.dir/progress.make

src/device/CMakeFiles/stream_kernels_single_xilinx: bin/stream_kernels_single.xclbin
src/device/CMakeFiles/stream_kernels_single_xilinx: src/common/parameters.h

bin/stream_kernels_single.xclbin: settings/settings.link.xilinx.stream_kernels_single.ini
bin/stream_kernels_single.xclbin: src/device/xilinx_tmp_compile/stream_kernels_single.xo
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../bin/stream_kernels_single.xclbin"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device && /tools/Xilinx/Vitis/2020.2/bin/v++ -DXILINX_FPGA --report_dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/bin/xilinx_reports --log_dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/bin/xilinx_reports/logs -O3 -t hw -I/mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/common/ -I/mnt/2UB102/HPCC_FPGA-master/STREAM/src/device --platform xilinx_u50_gen3x16_xdma_201920_3 -R2 -l --config /mnt/2UB102/HPCC_FPGA-master/STREAM/build/settings/settings.link.xilinx.stream_kernels_single.ini -j 40 -o /mnt/2UB102/HPCC_FPGA-master/STREAM/build/bin/stream_kernels_single.xclbin xilinx_tmp_compile/stream_kernels_single.xo

src/device/xilinx_tmp_compile/stream_kernels_single.xo: ../settings/settings.compile.xilinx.stream_kernels_single.hbm.ini
src/device/xilinx_tmp_compile/stream_kernels_single.xo: src/device/stream_kernels_single_replicated_xilinx.cl
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating xilinx_tmp_compile/stream_kernels_single.xo"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device && /tools/Xilinx/Vitis/2020.2/bin/v++ -DXILINX_FPGA --report_dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/bin/xilinx_reports --log_dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/bin/xilinx_reports/logs -O3 -t hw -I/mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/common/ -I/mnt/2UB102/HPCC_FPGA-master/STREAM/src/device --platform xilinx_u50_gen3x16_xdma_201920_3 -R2 -c -j 40 -o xilinx_tmp_compile/stream_kernels_single.xo /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device/stream_kernels_single_replicated_xilinx.cl

settings/settings.link.xilinx.stream_kernels_single.ini: ../settings/settings.link.xilinx.stream_kernels_single.hbm.generator.ini
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating ../../settings/settings.link.xilinx.stream_kernels_single.ini"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device && /usr/bin/python3.10 /mnt/2UB102/HPCC_FPGA-master/STREAM/../scripts/code_generator/generator.py -o /mnt/2UB102/HPCC_FPGA-master/STREAM/build/settings/settings.link.xilinx.stream_kernels_single.ini -p num_replications=1 --comment "#" --comment-ml-start "$$" --comment-ml-end "$$" /mnt/2UB102/HPCC_FPGA-master/STREAM/settings/settings.link.xilinx.stream_kernels_single.hbm.generator.ini

src/device/stream_kernels_single_replicated_xilinx.cl: ../src/device/stream_kernels_single.cl
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/2UB102/HPCC_FPGA-master/STREAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating stream_kernels_single_replicated_xilinx.cl"
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device && /usr/bin/python3.10 /mnt/2UB102/HPCC_FPGA-master/STREAM/../scripts/code_generator/generator.py -o /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device/stream_kernels_single_replicated_xilinx.cl -p num_replications=1 -p num_total_replications=1 /mnt/2UB102/HPCC_FPGA-master/STREAM/src/device/stream_kernels_single.cl

stream_kernels_single_xilinx: bin/stream_kernels_single.xclbin
stream_kernels_single_xilinx: settings/settings.link.xilinx.stream_kernels_single.ini
stream_kernels_single_xilinx: src/device/CMakeFiles/stream_kernels_single_xilinx
stream_kernels_single_xilinx: src/device/stream_kernels_single_replicated_xilinx.cl
stream_kernels_single_xilinx: src/device/xilinx_tmp_compile/stream_kernels_single.xo
stream_kernels_single_xilinx: src/device/CMakeFiles/stream_kernels_single_xilinx.dir/build.make
.PHONY : stream_kernels_single_xilinx

# Rule to build all files generated by this target.
src/device/CMakeFiles/stream_kernels_single_xilinx.dir/build: stream_kernels_single_xilinx
.PHONY : src/device/CMakeFiles/stream_kernels_single_xilinx.dir/build

src/device/CMakeFiles/stream_kernels_single_xilinx.dir/clean:
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device && $(CMAKE_COMMAND) -P CMakeFiles/stream_kernels_single_xilinx.dir/cmake_clean.cmake
.PHONY : src/device/CMakeFiles/stream_kernels_single_xilinx.dir/clean

src/device/CMakeFiles/stream_kernels_single_xilinx.dir/depend:
	cd /mnt/2UB102/HPCC_FPGA-master/STREAM/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/2UB102/HPCC_FPGA-master/STREAM /mnt/2UB102/HPCC_FPGA-master/STREAM/src/device /mnt/2UB102/HPCC_FPGA-master/STREAM/build /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device /mnt/2UB102/HPCC_FPGA-master/STREAM/build/src/device/CMakeFiles/stream_kernels_single_xilinx.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/device/CMakeFiles/stream_kernels_single_xilinx.dir/depend

