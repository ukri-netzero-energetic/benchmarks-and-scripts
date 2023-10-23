Updated on 23/10/23 by A.Kibats
# SGEMM on FPGA
## SGEMM on Xilinx FPGA
The SGEMM benchmark code is included in a git submodule, `gemm_hls`.

1. Make sure this is present and up to date using `git submodule update --init --recursive`.
2. ssh into `nextgenio`
3. ssh into the node that has the FPGA you want to compile for and run on. See the [FPGA testbed docs on running on FPGAs](https://fpga.epcc.ed.ac.uk/docs/running_fpga.html) for more info on available hardware/nodes.
4. `source /home/nx08/shared/fpga/fpga_modules.sh && module load vitis` to load the vitis toolkits.
5. cd into `/gemm_hls/hlslib` and use `git fetch; git checkout xilinx-opencl-header` as per https://github.com/spcl/gemm_hls/issues/21 (deal with CL errors such as CL_MEM_EXT_PTR_XILINX under)
6. Use `xbutil examine` to list available hardware. You should get an output like this:
```
System Configuration
  OS Name              : Linux
  Release              : 3.10.0-1160.76.1.el7.x86_64
  Version              : #1 SMP Wed Aug 10 16:21:17 UTC 2022
  Machine              : x86_64
  CPU Cores            : 128
  Memory               : 257749 MB
  Distribution         : CentOS Linux 7 (Core)
  GLIBC                : 2.17
  Model                : ProLiant DL385 Gen10 Plus

XRT
  Version              : 2.11.634
  Branch               : 2021.1
  Hash                 : 5ad5998d67080f00bca5bf15b3838cf35e0a7b26
  Hash Date            : 2021-06-09 05:08:58
  XOCL                 : 2.11.634, 5ad5998d67080f00bca5bf15b3838cf35e0a7b26
  XCLMGMT              : 2.11.634, 5ad5998d67080f00bca5bf15b3838cf35e0a7b26

Devices present
  [0000:c3:00.1] : xilinx_u280_xdma_201920_3
  ```
7. Make a note of the device name. In the example above this is `xilinx_u280_xdma_201920_3`.
8. Edit the `set(MM_PLATFORM "xilinx_u250_gen3x16_xdma_3_1_202020_1" CACHE STRING "Platform string for Vitis.")` line in `gemm_hls/CMakeLists.txt`, replacing the platform string with the platform name found in the previous step.
9. If on amd01 node use `export PLATFORM_REPO_PATHS=/home/nx08/shared/fpga/xilinx/2020.2/Vitis/2020.2/platforms` to set only one platform.
10. Follow the instructions in `gemm_hls/README.md` to compile, however when instructed to use `cmake ../` use `cmake ../ -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DMM_DATA_TYPE=float -DMM_PARALLELISM_N=32 -DMM_PARALLELISM_M=8 -DMM_MEMORY_TILE_SIZE_N=512 -DMM_MEMORY_TILE_SIZE_M=512` to ensure cmake picks up GNU and not Intel.
11. Once compiled (Usually takes a few hours!) can use `./RunHardware.exe 1024 1024 1024 hw` in the compiled directory with different values of (n,k,m) which are sizes of the matrices (A is n*k, B is k*m and C=AB is n*m). Note it might be better to run with `hw off` when using large matrices.
