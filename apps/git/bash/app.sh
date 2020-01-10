#!/bin/bash
export REPO_PATH=$CLIENT_MOUNT/git/dash/chromium
#export INPUT_DIR=$MNT/git/bash/commits
N=1

pushd ${REPO_PATH}
/usr/bin/time git status
#git add .
#git commit -F - <"$INPUT_DIR/0.commit"
popd


