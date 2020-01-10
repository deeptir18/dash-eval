#!/bin/bash
pushd "$CLIENT_MOUNT"
$TIMECOMMAND $DASH_EVAL/apps/images/bash/app.sh
popd
