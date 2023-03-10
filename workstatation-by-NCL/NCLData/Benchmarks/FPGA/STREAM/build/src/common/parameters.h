#ifndef SRC_COMMON_PARAMETERS_H_
#define SRC_COMMON_PARAMETERS_H_

/**
 * Host specific parameters
 */
#define VERSION "2.6"
#define DEFAULT_REPETITIONS 10
#define DEFAULT_ARRAY_LENGTH 4096
#define DEFAULT_PLATFORM -1
#define DEFAULT_DEVICE -1
#define NUM_REPLICATIONS 1
#define DATA_TYPE_SIZE 8

#if DATA_TYPE_SIZE == 2
// use a custom half precision data tpe that also allows basic arithmetic. The validation will still
// be done in single precision using BLAS - if available
#define HOST_DATA_TYPE half_float::half
#else
#define HOST_DATA_TYPE cl_double
#endif

/**
 * Device specific parameters
 */
#define DEVICE_ARRAY_DATA_TYPE double
#define DEVICE_SCALAR_DATA_TYPE double
#define VECTOR_COUNT 1
#define DATA_TYPE_SIZE 8
#define UNROLL_COUNT 8
#define BUFFER_SIZE 4096
#define INNER_LOOP_BUFFERS
/* #undef USE_SVM */
#define USE_HBM

#define PROGRAM_DESCRIPTION "Implementation of the STREAM benchmark"\
                            " proposed in the HPCC benchmark suite for FPGA.\n"\
                            "Version: " VERSION "\n"

/**
Output separator
*/
#define HLINE "-------------------------------------------------------------\n"

#define COPY_KERNEL_TYPE 0
#define SCALE_KERNEL_TYPE 1
#define ADD_KERNEL_TYPE 2
#define TRIAD_KERNEL_TYPE 3


#endif // SRC_COMMON_PARAMETERS_H_
