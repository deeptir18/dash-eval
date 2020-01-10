#!/bin/bash
export MNT=/home/deeptir/mnt/dash_server
export REPO_PATH=$MNT/git/bash/chromium
export INPUT_DIR=$MNT/git/bash/commits
N=1
pushd ${REPO_PATH}
patch -p1 <"$INPUT_DIR/1-0.diff"
popd

