#!/bin/bash
pushd "$CLIENT_MOUNT_PARENT"
$TIMECOMMAND $DASH_EVAL/apps/distributed/bash/app.sh
popd
