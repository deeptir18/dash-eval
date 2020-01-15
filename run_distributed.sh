#!/bin/bash
source distributed_config.sh # sync configuration
python run_distributed.py results_distributed_sync dash distributed 0
python run_distributed.py results_distributed_sync bash distributed 0

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_distributed_async dash distributed 0
python run_distributed.py results_distributed_async bash distributed 0

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py results_distributed_sync dash distributed 1
python run_distributed.py results_distributed_sync bash distributed 1

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_distributed_async dash distributed 1
python run_distributed.py results_distributed_async bash distributed 1

python run_distributed.py results_distributed_sync dash distributed 2
python run_distributed.py results_distributed_sync bash distributed 2

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_distributed_async dash distributed 2
python run_distributed.py results_distributed_async bash distributed 2

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py results_distributed_sync dash distributed 3
python run_distributed.py results_distributed_sync bash distributed 3

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_distributed_async dash distributed 3
python run_distributed.py results_distributed_async bash distributed 3

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py results_distributed_sync dash distributed 4
python run_distributed.py results_distributed_sync bash distributed 4

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_distributed_async dash distributed 4
python run_distributed.py results_distributed_async bash distributed 4

