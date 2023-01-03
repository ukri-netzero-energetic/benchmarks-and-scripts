
if(NOT "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-subbuild/extern_hlslib-populate-prefix/src/extern_hlslib-populate-stamp/extern_hlslib-populate-gitinfo.txt" IS_NEWER_THAN "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-subbuild/extern_hlslib-populate-prefix/src/extern_hlslib-populate-stamp/extern_hlslib-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-subbuild/extern_hlslib-populate-prefix/src/extern_hlslib-populate-stamp/extern_hlslib-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/definelicht/hlslib.git" "extern_hlslib-src"
    WORKING_DIRECTORY "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/definelicht/hlslib.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout v1.2.1 --
  WORKING_DIRECTORY "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v1.2.1'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-subbuild/extern_hlslib-populate-prefix/src/extern_hlslib-populate-stamp/extern_hlslib-populate-gitinfo.txt"
    "/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-subbuild/extern_hlslib-populate-prefix/src/extern_hlslib-populate-stamp/extern_hlslib-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/mnt/2UB102/HPCC_FPGA-master/STREAM/build/_deps/extern_hlslib-subbuild/extern_hlslib-populate-prefix/src/extern_hlslib-populate-stamp/extern_hlslib-populate-gitclone-lastrun.txt'")
endif()

