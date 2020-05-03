#!/bin/bash
source config.sh
#python3 run_tests.py results_sync dash ray_tracing 0
#python3 run_tests.py results_sync bash ray_tracing 0
#python3 run_tests.py results_sync dash images 0
#python3 run_tests.py results_sync bash images 0
#python3 run_tests.py results_sync bash ray_tracing 1
#python3 run_tests.py results_sync dash ray_tracing 1
#python3 run_tests.py results_sync bash images 1
#python3 run_tests.py results_sync dash images 1
#python3 run_tests.py results_sync dash ray_tracing 2
#python3 run_tests.py results_sync bash ray_tracing 2
#python3 run_tests.py results_sync dash images 2
#python3 run_tests.py results_sync bash images 2
#python3 run_tests.py results_sync dash ray_tracing 3
#python3 run_tests.py results_sync bash ray_tracing 3
#python3 run_tests.py results_sync dash images 3
#python3 run_tests.py results_sync bash images 3
#python3 run_tests.py results_sync dash ray_tracing 4
#python3 run_tests.py results_sync bash ray_tracing 4
#python3 run_tests.py results_sync dash images 4

## run the ASYNCHRONOUS tests
#source config_async.sh
#python3 run_tests.py results_async dash ray_tracing 0
#python3 run_tests.py results_async bash ray_tracing 0
#python3 run_tests.py results_async dash images 0
#python3 run_tests.py results_async bash images 0
#python3 run_tests.py results_async bash ray_tracing 1
#python3 run_tests.py results_async dash ray_tracing 1
#python3 run_tests.py results_async bash images 1
#python3 run_tests.py results_async dash images 1
#python3 run_tests.py results_async dash ray_tracing 2
#python3 run_tests.py results_async bash ray_tracing 2
#python3 run_tests.py results_async dash images 2
#python3 run_tests.py results_async bash images 2
#python3 run_tests.py results_async dash ray_tracing 3
#python3 run_tests.py results_async bash ray_tracing 3
#python3 run_tests.py results_async dash images 3
#python3 run_tests.py results_async bash images 3
#python3 run_tests.py results_async dash ray_tracing 4
#python3 run_tests.py results_async bash ray_tracing 4
#python3 run_tests.py results_async dash images 4
#python3 run_tests.py results_async bash images 4

# run the scans
source config.sh
#python3 run_tests.py results_sync bash images 4
#python3 run_tests.py results_sync dash scans 2
#python3 run_tests.py results_sync bash scans 2

source config_async.sh
python3 run_tests.py results_async dash scans 0
python3 run_tests.py results_async dash scans 1
python3 run_tests.py results_async dash scans 2
python3 run_tests.py results_async dash scans 3
#python3 run_tests.py results_async dash scans 2
#python3 run_tests.py results_async bash scans 2

#source config.sh
#python3 run_tests.py results_sync dash scans 3
#python3 run_tests.py results_sync bash scans 3

#source config_async.sh
#python3 run_tests.py results_async dash scans 3
#python3 run_tests.py results_async bash scans 3

#source config.sh
#python3 run_tests.py results_sync dash scans 4
#python3 run_tests.py results_sync bash scans 4

#source config_async.sh
#python3 run_tests.py results_async dash scans 4
#python3 run_tests.py results_async bash scans 4

