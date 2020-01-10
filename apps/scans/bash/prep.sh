#!/bin/bash
DATAFILE="test_80_40GB.json"
MRTFILE="2019-10-12.0500.mrt"
rm_command="rm -rf ${SERVER_MOUNT}/scan_data/bash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
mkdir $CLIENT_MOUNT/scan_data/bash
cp_command="cp ${SERVER_MOUNT}/scan_data/${DATAFILE} ${SERVER_MOUNT}/scan_data/bash"
ssh ${USERNAME}@${SERVER} -i ${KEY} $cp_command
