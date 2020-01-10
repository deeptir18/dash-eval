#!/bin/bash
## ssh into the server and checkout a new branch
checkout_cmd="cd ${SERVER_MOUNT}/git/dash/chromium; git checkout HEAD~20; git checkout -b test_branch"
ssh ${USERNAME}@${SERVER} -i ${KEY} $checkout_cmd
# run a fresh status, to cache as much locally on the client as possible
pushd "${CLIENT_MOUNT}/git/dash/chromium"
## TODO: maybe it's ok to do this on the server? you know it takes 23 min?
git_status="cd ${SERVER_MOUNT}/git/dash/chromium; git status"
ssh ${USERNAME}@${SERVER} -i ${KEY} $git_status
popd

