#!/bin/bash
export DASH=/home/deeptir/research/fs_project/dash
export DASH_EVAL=/home/deeptir/research/fs_project/dash_eval
export MNT=/home/deeptir/mnt/rt_bucket
gcsfuse dash_raytracing_6gb $MNT
cd $MNT/logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b
/usr/bin/time -o $DASH_EVAL/scripts/dash_time.log $DASH/target/release/shell-exec $DASH_EVAL/apps/ray_tracing/dash/app.sh --mount_file $DASH/config/pancham.mount --annotations_file $DASH/config/eval_annotations.txt
cd $DASH_EVAL/scripts
fusermount -u $MNT
