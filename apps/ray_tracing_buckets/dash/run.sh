#!/bin/bash
sudo sysctl -w net.ipv4.ip_forward=1
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $CLIENT_BINARY $DASH_EVAL/apps/ray_tracing_buckets/dash/app.sh --mount_file $DASH_EVAL/buckets.mount --annotations_file $DASH_CLIENT_PATH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP
popd
