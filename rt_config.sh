#!/bin/bash -ex

# location of keys (for all machines (?)
export KEY="/home/deeptir/.ssh/uswest1_key"
export USERNAME="deeptir"
export SERVER="35.185.241.227"
export CLIENT="171.67.76.56"

# location of this repo
export DASH_EVAL="/home/deeptir/research/fs_project/dash_eval"

# location of dash repo on proxy server & client machine
export DASH_CLIENT_PATH="/home/deeptir/research/fs_project/dash"
export DASH_SERVER_PATH="/home/deeptir/research/fs_project/dash"

# location of dash execution binaries
export SERVER_BINARY="${DASH_SERVER_PATH}/target/release/server"
export CLIENT_BINARY="${DASH_CLIENT_PATH}/target/release/shell-exec"

# location of datafiles both on the server machine and the client machine
export SERVER_MOUNT="/home/deeptir/mnt/rt_bucket"
export SERVER_TMP="/mnt/disks/ssd3/dash_tmp"
export SERVER_LOGS="/mnt/disks/ssd3/dash_logs" # then sub indexed by app name, and trial
export CLIENT_MOUNT="/home/deeptir/mnt/rt_bucket"
export CLIENT_TMP="/home/deeptir/research/fs_project/tmp"
