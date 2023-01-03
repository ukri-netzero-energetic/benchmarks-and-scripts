#!/bin/bash

#Copyright 2017 Intel Corporation.
#
#The source code, information and material ("Material") contained herein is owned
#by Intel Corporation or its suppliers or licensors, and title to such Material
#remains with Intel Corporation or its suppliers or licensors. The Material
#contains proprietary information of Intel or its suppliers and licensors. The
#Material is protected by worldwide copyright laws and treaty provisions.
#No part of the Material may be used, copied, reproduced, modified, published,
#uploaded, posted, transmitted, distributed or disclosed in any way without
#Intel's prior express written permission. No license under any patent, copyright
#or other intellectual property rights in the Material is granted to or conferred
#upon you, either expressly, by implication, inducement, estoppel or otherwise.
#Any license under such intellectual property rights must be express and approved
#by Intel in writing.
#
#Unless otherwise agreed by Intel in writing, you may not remove or alter this
#notice or any other notice embedded in Materials by Intel or Intel's suppliers or
#licensors in any way.


#Note: A copy of the license is included in the LICENSE file that accompanies the
#software.


#################################################################################################
#											    	#
#  Purpose: Runs the xGEMM benchmark with a specified number of threads, problem size, and 	#
#	    math library.									#
#												#
#  Usage: ./run.sh <NUM_THREADS> <SIZE_N> <MATH_LIBRARY>					#
#  												#
#	  NUM_THREADS: Number of threads to run benchmark with.					#
#	  SIZE_N: Problem size to run benchmark with. "all" runs a preselected set of sizes.	#
#	  MATH_LIBRARY: Select "mkl" for Intel(R) Math Kernel Library or "blis" for BLIS*	#
#		        (BLAS-like Library Instantiation Software Framework).			#
#################################################################################################

sudo ./test.sh
time ./stream.100M
sudo ./test.sh
