#!/bin/bash
rm_command="rm -rf ${SERVER_MOUNT}/ray_tracing/bash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
mkdir_command="mkdir ${SERVER_MOUNT}/ray_tracing/bash/"
ssh ${USERNAME}@${SERVER} -i ${KEY} $mkdir_command
cp_command="cp -r ${SERVER_MOUNT}/ray_tracing/logs ${SERVER_MOUNT}/ray_tracing/bash"
ssh ${USERNAME}@${SERVER} -i ${KEY} $cp_command

