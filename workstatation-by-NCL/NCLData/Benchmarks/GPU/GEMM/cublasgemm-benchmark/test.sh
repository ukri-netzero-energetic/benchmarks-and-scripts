#!/usr/bin/env bash
#
# Bash script to sample Intel RAPL inteface and save numbers to a file.
# This script will run until manually interrupted.
#
# The CPU_POWER_OUTPUT_FILE environment variable must be set before
# running this script.

# Make sure CPU_POWER_OUTPUT_FILE variable is defined

# Sampling cadence in seconds
CADENCE="0.1"
COUNTER="/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj"

echo "Sampling $COUNTER" >> power.txt
echo "Cadence = $CADENCE seconds" >> power.txt
#while /bin/true; do
    RAPL=$(cat $COUNTER)
    #TIME=$(date --iso-8601=ns)
    #echo "$TIME, $RAPL" >> power.txt
     echo "$RAPL"
     #echo "$RAPL" >> power.txt
    #sleep $CADENCE
#done
