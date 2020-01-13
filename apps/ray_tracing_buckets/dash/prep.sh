#!/bin/bash
# ssh and mount the bucket on the server
remote_mount_cmd="gcsfuse dash_raytracing_6gb ${SERVER_MOUNT}"
ssh ${USERNAME}@${SERVER} -i ${KEY} $remote_mount_cmd

# mount the bucket locally
export GOOGLE_APPLICATION_CREDENTIALS=/home/deeptir/.keys/splitfs-0f146becfcac.json
gcsfuse dash_raytracing_6gb ${CLIENT_MOUNT}

