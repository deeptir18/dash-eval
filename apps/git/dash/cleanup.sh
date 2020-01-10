#!/bin/bash
cleanup_cmd="cd ${SERVER_MOUNT}/git/dash/chromium; git stash; git checkout master; git branch -D test_branch"
ssh ${USERNAME}@${SERVER} -i ${KEY} $cleanup_cmd
