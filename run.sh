#!/bin/bash
source /home/deeptir/research/fs_project/results/winter_results/configs/config.sh
export FOLDER="/home/deeptir/research/fs_project/results/testing/may3night_pancham_sync"
python3 run_tests.py $FOLDER dash ray_tracing 0
python3 run_tests.py $FOLDER bash ray_tracing 0
python3 run_tests.py $FOLDER dash images 0
python3 run_tests.py $FOLDER bash images 0
python3 run_tests.py $FOLDER bash ray_tracing 1
python3 run_tests.py $FOLDER dash ray_tracing 1
python3 run_tests.py $FOLDER bash images 1
python3 run_tests.py $FOLDER dash images 1
python3 run_tests.py $FOLDER dash ray_tracing 2
python3 run_tests.py $FOLDER bash ray_tracing 2
python3 run_tests.py $FOLDER dash images 2
python3 run_tests.py $FOLDER bash images 2
python3 run_tests.py $FOLDER dash ray_tracing 3
python3 run_tests.py $FOLDER bash ray_tracing 3
python3 run_tests.py $FOLDER dash images 3
python3 run_tests.py $FOLDER bash images 3
python3 run_tests.py $FOLDER dash ray_tracing 4
python3 run_tests.py $FOLDER bash ray_tracing 4
python3 run_tests.py $FOLDER dash images 4
python3 run_tests.py $FOLDER bash images 4

python3 run_tests.py $FOLDER dash scans 0
python3 run_tests.py $FOLDER bash scans 0
python3 run_tests.py $FOLDER dash scans 1
python3 run_tests.py $FOLDER bash scans 1
python3 run_tests.py $FOLDER dash scans 2
python3 run_tests.py $FOLDER bash scans 2
python3 run_tests.py $FOLDER dash scans 3
python3 run_tests.py $FOLDER bash scans 3
python3 run_tests.py $FOLDER dash scans 4
python3 run_tests.py $FOLDER bash scans 4
