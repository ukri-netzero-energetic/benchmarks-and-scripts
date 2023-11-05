#!/bin/bash

echo NB only currently launches FPGA power monitor 
echo To Do \- add launch of host CPU monitoring

## set NGIO_SCRIPTS_DIR appropriately 
## Typically same directory as this script, which is checked out as git HEAD/measurement_scripts
NGIO_SCRIPTS_DIR=`dirname $0`
POWER_SAMPLER_EXE=${NGIO_SCRIPTS_DIR}/sample_amdFPGA_power.sh

usage () {
  echo $0 MSECS DATAFILE EXE \[parameters\]
  echo script \(mkbane 2023\)to run \$EXE \(and any given parameters\)
  echo and record instantaneous power every \$MSECS milliseconds using script 
  echo $POWER_SAMPLER_EXE
  echo saving info to \$DATAFILE
}

trap 'echo Error at line ${LINENO};usage;echo Aborting;exit -100' ERR
echo $0 uses power sampler\:
ls -lt ${POWER_SAMPLER_EXE}

if [[ $# -ge 3 ]]; then
  DELAY=$1
  DATAFILE=$2
  EXE=$3
else
  usage
  exit -1
fi

# shift to get any parameters to $EXE
shift; shift; shift
PARAMETERS=$@
echo Running $EXE with parameters $PARAMETERS

# start recording power
## abort if DATAFILE pre-exists
if test -e $DATAFILE ; then 
  echo Datafile $DATAFILE already exists \- abort
  exit -2
fi

echo Recording power in to $DATAFILE
ms=`echo "scale=6;$DELAY/1000" | bc`
echo $ms seconds \($DELAY millisecs\) 

# initial measuring instantaneous power (mW) to $DATAFILE

## delorean example:
# while true; do
#   echo `date +%s.%N` `~mkbane/utils/boardPower.exe|awk '{print $NF}'` >> $DATAFILE
#   sleep $ms
# done &

## nextgenio example (has own loop, writes direct to given file):
${POWER_SAMPLER_EXE} $ms $DATAFILE &

### useful for debugging but isn't energy of EXE
# echo sleep 5 seconds to get background power consumption
# sleep 5

# start your application
## debug: echo Now running ${EXE}
${EXE} ${PARAMETERS}
echo Run completed at `date +%s.%N`
## debug: echo $EXE has finished

### useful for debugging but isn't energy of EXE
# echo sleep 5 seconds to get background power consumption
# sleep 5

# turn off trap (in case there is no sleep)
trap '' ERR
killall sleep # force update of FPGA power monitor
kill %1
echo monitoring killed at `date +%s.%N`

echo completed\. See $DATAFILE and integrate power \(2nd col\) over time \(1st col\)
