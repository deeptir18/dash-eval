#!/bin/bash
pushd "$CLIENT_MOUNT_PARENT"
$TIMECOMMAND $DASH_EVAL/apps/comm/bash/app.sh
popd
