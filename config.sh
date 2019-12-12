#!/bin/bash -ex

# location of keys
export uswest1_key = "/home/deeptir/.ssh/uswest1_key.pub"

# location of dash repo on proxy server & client machine
export DASH_CLIENT_PATH="/home/deeptir/research/fs_project/dash"
export DASH_SERVER_PATH="/home/deeptir/research/fs_project/dash"

# location of dash execution binaries
export SERVER_BINARY="${DASH_SERVER_PATH}/dash/src/bin/server.rs"
