#!/bin/bash
rm_command="rm -rf ${SERVER_MOUNT}/images/dash > /dev/null 2>&1"
ssh ${USERNAME}@${SERVER} -i ${KEY} $rm_command

