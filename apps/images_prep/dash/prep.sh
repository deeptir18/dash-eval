#!/bin/bash
DATAFILE=originals
rm_command="rm -rf ${SERVER_MOUNT}/images/dash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
mkdir_command="mkdir -p ${SERVER_MOUNT}/images/dash/thumbs"
ssh ${USERNAME}@${SERVER} -i ${KEY} $mkdir_command
cp_command="cp -r ${SERVER_MOUNT}/images/${DATAFILE} ${SERVER_MOUNT}/images/dash"
ssh ${USERNAME}@${SERVER} -i ${KEY} $cp_command
