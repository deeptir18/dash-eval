#!/bin/bash
RESULTS=$1
TRIAL=$2
pushd "$CLIENT_MOUNT/git/bash/chromium"
# 1: apply patch for this commit
for i in $(seq 5 -1 1)
do
    statustime="/usr/bin/time --output=${RESULTS}/${TRIAL}-status-${i}.log --verbose"
    addtime="/usr/bin/time --output=${RESULTS}/${TRIAL}-add-${i}.log --verbose"
    committime="/usr/bin/time --output=${RESULTS}/${TRIAL}-commit-${i}.log --verbose"
    patchtime="/usr/bin/time --output=${RESULTS}/${TRIAL}-patchprep-${i}.log --verbose"
    patchfile="../commits/${i}-$((${i}-1)).diff"

    ## add the patch
    ${patchtime} patch -p1 <"${patchfile}"

    ## run and time the status
    ${statustime} git status

    ## run and time the add
    ${addtime} git add .

    ## run and time the commit
    ${committime} git commit -F "$CLIENT_MOUNT/git/bash/commits/$((${i}-1)).commit"
done
