# GEMM on nextgenio CPU
The 'gemmbench.c' is a generic Intel code for benchmarking both SGEMM and DGEMM with both MKL and BLIS libraries, via the Intel script 'run.sh'

The Energetic project reported SGEMM data (presumably with MKL library).
To build on nextgenio-amd01 node for MKL, the following modules need to be loaded:
```
compiler gnu/11.2.0 mkl
```
Compile via Intel's Makefile solely for MKL (the 'make clean' only necessary if previous failed attempts):
```
make clean; make mkl
```
which creates files 'sgemmbench.mkl' and 'dgemmbench.mkl' for SGEMM and DGEMM respectively.
To run the SGEMM benchmark for problem size 4096 on 1 OpenMP thread:
```
export OMP_NUM_THREADS=1; ./sgemmbench.mkl 4096
```
You should receive (on nextgenio-amd01 node) output similar to:
```
14:11:34  
mkbane@nextgenio-amd01 CPU$ export OMP_NUM_THREADS=1; ./sgemmbench.mkl 4096
SGEMM Performance N =   4096 :    75.0101 GF
```
Note that Intel 'run.sh' uses numactl. Note that could vary the number of OMP_NUM_THREADS to be the number of cores.
