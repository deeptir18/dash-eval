#!/bin/bash
TIMEFILE=$1
export DASH=/home/deeptir/research/fs_project/dash
export DASH_EVAL=/home/deeptir/research/fs_project/dash_eval
export MNT=/home/deeptir/mnt/dash_server/scan_data/
$DASH_EVAL/apps/scan/dash/prep.sh
cd $MNT
/usr/bin/time -o $TIMEFILE $DASH/target/release/shell-exec $DASH_EVAL/apps/scans/dash/app.sh --mount_file $DASH/config/pancham.mount --annotations_file $DASH/config/eval_annotations.txt
cd $DASH_EVAL/scripts
