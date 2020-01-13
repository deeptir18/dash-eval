#!/bin/bash
export GOOGLE_APPLICATION_CREDENTIALS=/home/deeptir/.keys/splitfs-0f146becfcac.json
gcsfuse dash_raytracing_6gb ${CLIENT_MOUNT}

