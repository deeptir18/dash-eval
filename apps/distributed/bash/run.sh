#!/bin/bash
pushd "$CLIENT_MOUNT_PARENT"
echo "hello"
$TIMECOMMAND $DASH_EVAL/apps/distributed/bash/app.sh
popd
