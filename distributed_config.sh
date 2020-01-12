#!/bin/bash -ex

# location of keys (for all machines (?)
export KEY="/home/deeptir/.ssh/uswest1_key"
export USERNAME="deeptir"
export CLIENT="171.67.76.56"

# location of this repo
export DASH_EVAL="/home/deeptir/research/fs_project/dash_eval"

# location of dash repo on proxy server & client machine
export DASH_CLIENT_PATH="/home/deeptir/research/fs_project/dash"
export DASH_SERVER_PATH="/home/deeptir/research/fs_project/dash"

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
export SERVER_LOGS="dash_logs"
export SERVER_TMP="dash_tmp"
export CLIENT_MNT_BASE="/home/deeptir/mnt/mount" # will either be nfs_deepti_sync or nfs_deepti_async as the subfolder
export CLIENT_TMP="/home/deeptir/research/fs_project/tmp"
export CLIENT_MOUNT1="/home/deeptir/mnt/mount1"
export CLIENT_MOUNT2="/home/deeptir/mnt/mount2"
export CLIENT_MOUNT3="/home/deeptir/mnt/mount3"
export CLIENT_MOUNT4="/home/deeptir/mnt/mount4"
export CLIENT_MOUNT5="/home/deeptir/mnt/mount5"
export CLIENT_MOUNT_PARENT="/home/deeptir/mnt"
# location of dash execution binaries
export SERVER_BINARY="${DASH_SERVER_PATH}/target/release/server"
export CLIENT_BINARY="${DASH_CLIENT_PATH}/target/release/shell-exec"


