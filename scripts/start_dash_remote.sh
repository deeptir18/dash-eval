#!/bin/bash
### This is a script for starting the dash server remotely.
logfolder=$1
logname=$2

## make sure the logfile exists
mkdir_cmd="mkdir -p ${logfolder}"
ssh ${USERNAME}@${SERVER} -i ${KEY} $mkdir_cmd

## run dash remotely - this is asynchronous, so make sure to wrap this in a process
run_dash_cmd="${SERVER_BINARY} --folder ${SERVER_MOUNT} --ip_addr ${CLIENT} --tmpfile ${SERVER_TMP}" > ${logfolder}/${logname} 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $run_dash_cmd
