#!/bin/bash
pushd "$CLIENT_MOUNT_PARENT"
echo $PWD
$TIMECOMMAND $CLIENT_BINARY $DASH_EVAL/apps/distributed/dash/app.sh --mount_file $DASH_CLIENT_PATH/config/distributed.config --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd $CLIENT_MOUNT_PARENT --tmpfile $CLIENT_TMP --tracing_level warn
popd
