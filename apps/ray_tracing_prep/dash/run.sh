#!/bin/bash
pushd "$CLIENT_MOUNT"
cat ray_tracing/dash/logs/1.INFO | grep "\[RAY\]" | head -n1 | cut -c 7- > ray_tracing/dash/logs/rays.csv
echo "Done with prep"
$TIMECOMMAND $CLIENT_BINARY $DASH_EVAL/apps/ray_tracing_prep/dash/app.sh --mount_file $DASH_CLIENT_PATH/config/sample.config --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP --prep --tracing_level info
popd
