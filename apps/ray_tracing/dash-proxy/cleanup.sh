#!/bin/bash
rm_command="rm -rf ${SERVER_MOUNT}/ray_tracing/dash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
# rm /home/deeptir/research/fs_project/dash_eval/dash_output.log
