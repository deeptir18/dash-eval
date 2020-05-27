#!/bin/bash
rm_command="rm -rf ${SERVER_MOUNT}/ray_tracing/bash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command
rm /home/deeptir/research/fs_project/dash_eval/bash_output.log

