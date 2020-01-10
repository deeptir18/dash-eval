#!/bin/bash
DATAFILE=originals
rm_command="rm -rf ${SERVER_MOUNT}/images/bash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
mkdir_command="mkdir -p ${SERVER_MOUNT}/images/bash/thumbs"
ssh ${USERNAME}@${SERVER} -i ${KEY} $mkdir_command
cp_command="cp -r ${SERVER_MOUNT}/images/${DATAFILE} ${SERVER_MOUNT}/images/bash"
ssh ${USERNAME}@${SERVER} -i ${KEY} $cp_command
