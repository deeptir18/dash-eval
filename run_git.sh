#!/bin/bash

source git_config.sh
#python3 run_tests.py results_async bash git 0
python3 run_tests.py results_async dash git 0

python3 run_tests.py results_async dash git 1
python3 run_tests.py results_async dash git 2

#python3 run_tests.py results_async bash git 1
#python3 run_tests.py results_async bash git 2

python3 run_tests.py results_async dash git 3
python3 run_tests.py results_async dash git 4

#python3 run_tests.py results_async bash git 4
#python3 run_tests.py results_async dash git 3




