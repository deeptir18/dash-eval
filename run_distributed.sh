#!/bin/bash
export SYNC_FOLDER="/home/deeptir/research/results/may27_sync"
export ASYNC_FOLDER="/home/deeptir/research/results/may27_async"
source /home/deeptir/research/fs_project/results/configs/distributed_config.sh # sync configuration
#python run_distributed.py $SYNC_FOLDER dash distributed 0
python run_distributed.py $SYNC_FOLDER bash distributed 0

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py $ASYNC_FOLDER dash distributed 0
python run_distributed.py $ASYNC_FOLDER bash distributed 0

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py $SYNC_FOLDER dash distributed 1
python run_distributed.py $SYNC_FOLDER bash distributed 1

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py $ASYNC_FOLDER dash distributed 1
python run_distributed.py $ASYNC_FOLDER bash distributed 1

python run_distributed.py $SYNC_FOLDER dash distributed 2
python run_distributed.py $SYNC_FOLDER bash distributed 2

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py $ASYNC_FOLDER dash distributed 2
python run_distributed.py $ASYNC_FOLDER bash distributed 2

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py $SYNC_FOLDER dash distributed 3
python run_distributed.py $SYNC_FOLDER bash distributed 3

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py $ASYNC_FOLDER dash distributed 3
python run_distributed.py $ASYNC_FOLDER bash distributed 3

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py $SYNC_FOLDER dash distributed 4
python run_distributed.py $SYNC_FOLDER bash distributed 4

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py $ASYNC_FOLDER dash distributed 4
python run_distributed.py $ASYNC_FOLDER bash distributed 4

