#!/bin/bash
echo "At start of mount proxy"
mount_command="sudo mount -t nfs ${SERVER}:${SERVER_MOUNT} ${PROXY_SERVER_MOUNT}"
ssh ${USERNAME}@${PROXY_SERVER} -i ${KEY} $mount_command
echo "Successfully mounted proxy"
