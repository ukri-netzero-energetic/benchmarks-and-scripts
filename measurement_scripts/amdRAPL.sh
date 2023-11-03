#!/bin/bash

# WARNING: numbering is as per AMD i.e. from 1 not 0

# expect something to measure
if [[ $# -lt 1 ]]; then
  echo Usage\:
  echo $0 COMMAND \[ parameters \]
  exit -10
fi

# amdRAPL: 
# script to measure energy of the command via use of amd_energy kernel module, see
# https://github.com/amd/amd_energy
# to expose AMD chip RAPL info to counters within $ENERGY_DIR
# ENERGY_DIR is platform dependent

# specific dir with files containing uJoules since reboot
# applies to nextgenio: amd01, amd03
ENERGY_DIR=/sys/devices/platform/amd_energy.0/hwmon/hwmon5

start_socket1_energy=`cat ${ENERGY_DIR}/energy65_input`
start_socket2_energy=`cat ${ENERGY_DIR}/energy66_input`

# time $@
$@

finish_socket1_energy=`cat ${ENERGY_DIR}/energy65_input`
finish_socket2_energy=`cat ${ENERGY_DIR}/energy66_input`

let energy1=($finish_socket1_energy-$start_socket1_energy)/1000
let energy2=($finish_socket2_energy-$start_socket2_energy)/1000
echo socket 1 energy consumed\: $energy1 milliJoules
echo socket 2 energy consumed\: $energy2 milliJoules
