#!/bin/bash
# TODO: add mounting and unmounting to the prep between each trial?
DATAFILE="test_80_40GB.json"
MRTFILE="2019-10-12.0500.mrt"
echo "Running dash prep script for port scan app"
rm_command="rm -rf ${SERVER_MOUNT}/scan_data/dash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
mkdir $CLIENT_MOUNT/scan_data/dash
cp_command="cp ${SERVER_MOUNT}/scan_data/${DATAFILE} ${SERVER_MOUNT}/scan_data/dash"
ssh ${USERNAME}@${SERVER} -i ${KEY} $cp_command
