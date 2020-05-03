#!/bin/bash
echo "Running dash app for port scan app"
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $CLIENT_BINARY $DASH_EVAL/apps/scans/dash/app.sh --mount_file $DASH_CLIENT_PATH/config/sample.config --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP
popd
