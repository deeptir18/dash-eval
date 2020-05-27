#!/bin/bash
unmount_command="if df | grep $SERVER > /dev/null 2>&1; then sudo umount ${PROXY_SERVER_MOUNT} > /dev/null; fi"
ssh ${USERNAME}@${PROXY_SERVER} -i ${KEY} $unmount_command
