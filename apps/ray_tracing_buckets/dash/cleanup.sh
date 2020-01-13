#!/bin/bash
unmount_cmd="fusermount -u ${SERVER_MOUNT}"
ssh ${USERNAME}@${SERVER} -i ${KEY} $unmount_cmd

## unmount locally
fusermount -u $CLIENT_MOUNT
