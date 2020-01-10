#!/bin/bash
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $DASH_EVAL/apps/scans/bash/app.sh
popd
