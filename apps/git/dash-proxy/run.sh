#!/bin/bash
# don't predeclare time commands here
RESULTS=$1
TRIAL=$2
NUM_COMMITS=20
pushd "$CLIENT_MOUNT/git/dash/chromium"
# 1: apply a patch for this commit
for i in $(seq ${NUM_COMMITS} -1 1)
do
    statustime="/usr/bin/time --output=${RESULTS}/${TRIAL}-status-${i}.log --verbose"
    addtime="/usr/bin/time --output=${RESULTS}/${TRIAL}-add-${i}.log --verbose"
    committime="/usr/bin/time --output=${RESULTS}/${TRIAL}-commit-${i}.log --verbose"
    patchtime="/usr/bin/time --output=${RESULTS}/${TRIAL}-patchprep-${i}.log --verbose"
    patchfile="../commits/${i}-$((${i}-1)).diff"
    commitfile="${DASH_EVAL}/apps/git/dash-proxy/commit$((${i}-1)).sh"

    ## add the patch
    ${patchtime} patch -p1 <"${patchfile}"
    echo "Ran patch # $i"

    ## run the status
    ${statustime} $CLIENT_BINARY ${DASH_EVAL}/apps/git/dash-proxy/status.sh --mount_file ${DASH_CLIENT_PATH}/config/sample_proxy.config --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd "${CLIENT_MOUNT}/git/dash/chromium" --tmpfile $CLIENT_TMP
    echo "Ran status # $i"
    ## run the add
    ${addtime} $CLIENT_BINARY ${DASH_EVAL}/apps/git/dash-proxy/add.sh --mount_file ${DASH_CLIENT_PATH}/config/sample_proxy.config --annotations_file ${DASH_CLIENT_PATH}/config/eval_annotations.txt --pwd "${CLIENT_MOUNT}/git/dash/chromium" --tmpfile $CLIENT_TMP
    echo "Ran add # $i"
    ## run the commit
    ${committime} $CLIENT_BINARY $commitfile --mount_file ${DASH_CLIENT_PATH}/config/sample_proxy.config --annotations_file ${DASH_CLIENT_PATH}/config/eval_annotations.txt --pwd "${CLIENT_MOUNT}/git/dash/chromium" --tmpfile $CLIENT_TMP
    echo "Ran commit # $i"
done
popd
