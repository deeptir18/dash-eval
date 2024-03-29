#!/bin/bash
checkout_cmd="cd ${SERVER_MOUNT}/git/bash/chromium; git checkout HEAD~5; git checkout -b test_branch"
ssh ${USERNAME}@${SERVER} -i ${KEY} $checkout_cmd
# run a fresh status, to cache as much locally on the client as possible
echo "running status"
pushd "${CLIENT_MOUNT}/git/bash/chromium"
# todo: should we time this?
git status
popd
echo "done running status"
