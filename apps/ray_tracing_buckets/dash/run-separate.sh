#!/bin/bash
pushd "$CLIENT_MOUNT"
$TIMECOMMAND_1 $DASH/target/release/shell-exec $DASH_EVAL/apps/scans/dash/cmd1.sh --mount_file $DASH/config/pancham.mount --annotations_file $DASH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP

$TIMECOMMAND_2 $DASH/target/release/shell-exec $DASH_EVAL/apps/scans/dash/cmd2.sh --mount_file $DASH/config/pancham.mount --annotations_file $DASH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP

$TIMECOMMAND_3 $DASH/target/release/shell-exec $DASH_EVAL/apps/scans/dash/cmd3.sh --mount_file $DASH/config/pancham.mount --annotations_file $DASH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP

$TIMECOMMAND_4 $DASH/target/release/shell-exec $DASH_EVAL/apps/scans/dash/cmd4.sh --mount_file $DASH/config/pancham.mount --annotations_file $DASH/config/eval_annotations.txt --pwd $CLIENT_MOUNT --tmpfile $CLIENT_TMP


