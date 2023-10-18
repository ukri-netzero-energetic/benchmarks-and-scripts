#!/usr/bin/env bash
#
# Bash script to sample Xilinx votage/current files and save numbers to a file.
# This script will run until manually interrupted.
#

### MKB: save to filename given, use 'xmc_power' to get full power draw

### MKB: record power directly (prev version only had some not all rails for I,V)
### MKB: COUNTER_DIR is host & device specific
COUNTER_DIR="/sys/devices/pci0000:c0/0000:c0:01.1/0000:c3:00.1/xmc.u.19922944"
COUNTER=$COUNTER_DIR/xmc_power # this is mW
if  ! test -r $COUNTER ; then 
    echo Error \- expected counter file
    echo $COUNTER 
    echo not exist \| nor readable \- aborting this run. Fix and try again!
    exit -1
fi


usage() {
    echo $0 INTERVAL DATAFILE
    echo usage\: records power \(milliWatt\) of FPGA power at 
    echo $COUNTER 
    echo every INTERVAL seconds to \(unique\) DATAFILE
}

if [[ $# -ne 2 ]]; then
    usage
    echo Error \- need to define INTERVAL and a unique DATAFILE
    exit -10
fi

# Sampling cadence in seconds
CADENCE=${1}
# datafile to save data
DATAFILE=${2}
if test -r $DATAFILE ; then
    usage
    echo Error \- datafile
    echo $DATAFILE
    echo already exists - choose another filename or delete, then try again!
    exit -5
fi

while /bin/true; do
    echo `date +%s.%N` `cat $COUNTER` >> ${DATAFILE}
    sleep $CADENCE
done
