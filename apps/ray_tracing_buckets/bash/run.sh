#!/bin/bash
sudo sysctl -w net.ipv4.ip_forward=1
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $DASH_EVAL/apps/ray_tracing_buckets/bash/app.sh
popd
