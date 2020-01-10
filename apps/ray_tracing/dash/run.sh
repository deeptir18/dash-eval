#!/bin/bash
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $CLIENT_BINARY $DASH_EVAL/apps/ray_tracing/dash/app.sh --mount_file $DASH_CLIENT_PATH/config/pancham.mount --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP
popd
