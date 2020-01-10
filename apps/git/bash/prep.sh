#!/bin/bash
checkout_cmd="cd ${SERVER_MOUNT}/git/bash/chromium; git checkout HEAD~20; git checkout -b test_branch"
ssh ${USERNAME}@${SERVER} -i ${KEY} $checkout_cmd
# run a fresh status, to cache as much locally on the client as possible
pushd "${CLIENT_MOUNT}/git/bash/chromium"
git status
popd
