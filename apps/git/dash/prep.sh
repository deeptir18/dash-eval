#!/bin/bash
NUM_COMMITS_MINUS_ONE=19
NUM_COMMITS=20
## make sure to replace the commit files
pushd ${DASH_EVAL}/apps/git/dash
for i in $(seq ${NUM_COMMITS_MINUS_ONE} -1 0)
do
    echo "git commit -F ${CLIENT_MOUNT}/git/dash/commits/$i.commit" > commit$i.sh
done
popd

## ssh into the server and checkout a new branch
checkout_cmd="cd ${SERVER_MOUNT}/git/dash/chromium; git checkout HEAD~${NUM_COMMITS}; git checkout -b test_branch"
ssh ${USERNAME}@${SERVER} -i ${KEY} $checkout_cmd
# run a fresh status, to cache as much locally on the client as possible
pushd "${CLIENT_MOUNT}/git/dash/chromium"
## TODO: maybe it's ok to do this on the server? you know it takes 23 min?
git_status="cd ${SERVER_MOUNT}/git/dash/chromium; git status"
ssh ${USERNAME}@${SERVER} -i ${KEY} $git_status
echo "Finished prep for git"
popd

