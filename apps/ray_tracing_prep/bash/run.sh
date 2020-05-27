#!/bin/bash
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $DASH_EVAL/apps/ray_tracing/bash/app.sh
popd
