#!/bin/bash
# don't predeclare time commands here
RESULTS=$1
TRIAL=$2
pushd "$CLIENT_MOUNT/git/dash/chromium"
# 1: apply a patch for this commit
for i in $(seq 19 -1 18)
do
    statustime="/usr/bin/time --output=${RESULTS}/${TRIAL}-status-${i}.log --verbose"
    addtime="/usr/bin/time --output=${RESULTS}/${TRIAL}-add-${i}.log --verbose"
    committime="/usr/bin/time --output=${RESULTS}/${TRIAL}-commit-${i}.log --verbose"
    patchtime="/usr/bin/time --output=${RESULTS}/${TRIAL}-patchprep-${i}.log --verbose"
    patchfile="../commits/${i}-$((${i}-1)).diff"
    commitfile="${DASH_EVAL}/apps/git/dash/commit$((${i}-1)).sh"

    ## add the patch
    ${patchtime} patch -p1 <"${patchfile}"

    ## run the status
    ${statustime} $CLIENT_BINARY ${DASH_EVAL}/apps/git/dash/status.sh --mount_file    ${DASH_CLIENT_PATH}/config/pancham.mount --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd "${CLIENT_MOUNT}/git/dash/chromium" --tmpfile $CLIENT_TMP

    ## run the add
    ${addtime} $CLIENT_BINARY ${DASH_EVAL}/apps/git/dash/add.sh --mount_file ${DASH_CLIENT_PATH}/config/pancham.mount --annotations_file ${DASH_CLIENT_PATH}/config/eval_annotations.txt --pwd "${CLIENT_MOUNT}/git/dash/chromium" --tmpfile $CLIENT_TMP

    ## run the commit
    ${committime} $CLIENT_BINARY $commitfile --mount_file ${DASH_CLIENT_PATH}/config/pancham.mount --annotations_file ${DASH_CLIENT_PATH}/config/eval_annotations.txt --pwd "${CLIENT_MOUNT}/git/dash/chromium" --tmpfile $CLIENT_TMP
done
popd
