#!/bin/bash
source distributed_config.sh # sync configuration
python run_distributed.py results_sync dash distributed 3
python run_distributed.py results_sync bash distributed 3

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_async dash distributed 3
python run_distributed.py results_async bash distributed 3

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
python run_distributed.py results_sync dash distributed 4
python run_distributed.py results_sync bash distributed 4

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
python run_distributed.py results_async dash distributed 4
python run_distributed.py results_async bash distributed 4

export SERVER_FOLDER="nfs_deepti_sync" # OR ASYNC
#python run_distributed.py results_sync dash distributed 2
#python run_distributed.py results_sync bash distributed 2

export SERVER_FOLDER="nfs_deepti_async" # OR ASYNC
#python run_distributed.py results_distributed dash distributed 2
#python run_distributed.py results_distributed bash distributed 2

