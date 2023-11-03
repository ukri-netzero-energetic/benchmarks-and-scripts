#!/bin/bash

# WARNING: numbering is as per AMD i.e. from 1 not 0
# presumes 'likwid' available e.g. via 'module load likwid'
trap 'echo likwid not available \- please load \(with any dependencies\); exit -1' ERR
echo using\:
likwid-powermeter -v
echo for comparison to using AMD RAPL counters
trap unset ERR

# expect something to measure
if [[ $# -lt 1 ]]; then
  echo Usage\:
  echo $0 COMMAND \[ parameters \]
  exit -10
fi

# DEBUG version of amdRAPL: 
# this version also looks at each core and each socket to get average power, 
# before measuring energy of the command (firstly within likwid to compare, then just the command)
echo This is the DEBUG version of amdRAPL
# named "amdRAPL" since makes use of amd_energy kernel module, see
# https://github.com/amd/amd_energy
# to expose AMD chip RAPL info to counters within $ENERGY_DIR
# ENERGY_DIR is platform dependent

# specific dir with files containing uJoules since reboot
# applies to nextgenio: amd01, amd03
ENERGY_DIR=/sys/devices/platform/amd_energy.0/hwmon/hwmon5


## get all core ave power
let SLEEP=1
let DENOM=1000*$SLEEP
for k in ` seq 1 64`;do start=`cat ${ENERGY_DIR}/energy${k}_input`;sleep $SLEEP;finish=`cat ${ENERGY_DIR}/energy${k}_input`;let aveP=($finish-$start)/$DENOM;echo $k $finish $start aver power of core ${k}\: ${aveP} mWatts;done 

# # get each socket ave power
for k in ` seq 65 66`;do start=`cat ${ENERGY_DIR}/energy${k}_input`;sleep $SLEEP;finish=`cat ${ENERGY_DIR}/energy${k}_input`;let aveP=($finish-$start)/$DENOM;echo $k $finish $start aver power of socket ${k-64}\: ${aveP} mWatts;done 

# now monitor sockets whilst run a job ($@) and compare to likwid
## presume 'module load likwid' outside of script

# allow cores to settle
sleep 4

start_time=`date +%s.%N` 
start_socket1_energy=`cat ${ENERGY_DIR}/energy65_input`
start_socket2_energy=`cat ${ENERGY_DIR}/energy66_input`

time likwid-powermeter $@

finish_time=`date +%s.%N` 
finish_socket1_energy=`cat ${ENERGY_DIR}/energy65_input`
finish_socket2_energy=`cat ${ENERGY_DIR}/energy66_input`

let energy1=($finish_socket1_energy-$start_socket1_energy)/1000
let energy2=($finish_socket2_energy-$start_socket2_energy)/1000
echo socket 1 energy consumed\: $energy1 milliJoules
echo socket 2 energy consumed\: $energy2 milliJoules

########## do separate (so not couting likwid):
echo 'only the executable'
# allow cores to re-settle
sleep 4
start_time=`date +%s.%N` 
start_socket1_energy=`cat ${ENERGY_DIR}/energy65_input`
start_socket2_energy=`cat ${ENERGY_DIR}/energy66_input`

time $@

finish_time=`date +%s.%N` 
finish_socket1_energy=`cat ${ENERGY_DIR}/energy65_input`
finish_socket2_energy=`cat ${ENERGY_DIR}/energy66_input`

let energy1=($finish_socket1_energy-$start_socket1_energy)/1000
let energy2=($finish_socket2_energy-$start_socket2_energy)/1000
echo socket 1 energy consumed\: $energy1 milliJoules
echo socket 2 energy consumed\: $energy2 milliJoules


echo Complete
