#!/bin/bash
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $CLIENT_BINARY $DASH_EVAL/apps/images/dash/app.sh --mount_file $DASH_CLIENT_PATH/config/sample_proxy.config --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP --prep --tracing_level info
popd
