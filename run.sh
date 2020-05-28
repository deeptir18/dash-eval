#!/bin/bash
source ~/research/fs_project/results/configs/config_async.sh
export FOLDER="/home/deeptir/research/results/may27_async"
python3 run_tests.py $FOLDER dash images 0
python3 run_tests.py $FOLDER bash images 0
python3 run_tests.py $FOLDER bash images 1
python3 run_tests.py $FOLDER dash images 1
python3 run_tests.py $FOLDER dash images 2
python3 run_tests.py $FOLDER bash images 2
python3 run_tests.py $FOLDER dash images 3
python3 run_tests.py $FOLDER bash images 3
python3 run_tests.py $FOLDER dash images 4
python3 run_tests.py $FOLDER bash images 4

echo "Done with all tests, transferring server logs back."
scp -r -i $KEY $USERNAME@$SERVER:$SERVER_LOGS $FOLDER/
