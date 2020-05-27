#!/bin/bash
source /home/deeptir/research/fs_project/results/configs/proxy_config.sh
export FOLDER="/home/deeptir/research/fs_project/results/testing/may25proxy_sync"
#python3 run_tests.py $FOLDER dash-proxy ray_tracing 0 separate_proxy
#python3 run_tests.py $FOLDER dash ray_tracing 0
#python3 run_tests.py $FOLDER bash ray_tracing 0
#python3 run_tests.py $FOLDER dash images 0
#python3 run_tests.py $FOLDER bash images 0
#python3 run_tests.py $FOLDER dash-proxy images 0 separate_proxy
#python3 run_tests.py $FOLDER dash-proxy ray_tracing 1 separate_proxy
#python3 run_tests.py $FOLDER bash ray_tracing 1
#python3 run_tests.py $FOLDER dash ray_tracing 1
#python3 run_tests.py $FOLDER dash-proxy images 1 separate_proxy
#python3 run_tests.py $FOLDER bash images 1
#python3 run_tests.py $FOLDER dash images 1
#python3 run_tests.py $FOLDER dash-proxy ray_tracing 2 separate_proxy
#python3 run_tests.py $FOLDER dash ray_tracing 2
#python3 run_tests.py $FOLDER bash ray_tracing 2
#python3 run_tests.py $FOLDER dash images 2
#python3 run_tests.py $FOLDER dash-proxy images 2 separate_proxy
#python3 run_tests.py $FOLDER bash images 2
#python3 run_tests.py $FOLDER dash-proxy ray_tracing 3 separate_proxy
#python3 run_tests.py $FOLDER dash ray_tracing 3
#python3 run_tests.py $FOLDER bash ray_tracing 3
#python3 run_tests.py $FOLDER dash images 3
#python3 run_tests.py $FOLDER dash-proxy images 3 separate_proxy
#python3 run_tests.py $FOLDER bash images 3
#python3 run_tests.py $FOLDER dash-proxy ray_tracing 4 separate_proxy
#python3 run_tests.py $FOLDER dash ray_tracing 4
#python3 run_tests.py $FOLDER bash ray_tracing 4
#python3 run_tests.py $FOLDER dash images 4
#python3 run_tests.py $FOLDER bash images 4
#python3 run_tests.py $FOLDER dash-proxy images 4 separate_proxy

# SCP all the logs back
#scp -r -i $KEY $USERNAME@$SERVER:$SERVER_LOGS $FOLDER/
python3 run_tests.py $FOLDER dash-proxy git 0 separate_proxy
python3 run_tests.py $FOLDER dash git 0
python3 run_tests.py $FOLDER dash-proxy git 1 separate_proxy
python3 run_tests.py $FOLDER dash git 1
python3 run_tests.py $FOLDER dash-proxy git 2 separate_proxy
python3 run_tests.py $FOLDER dash git 2
python3 run_tests.py $FOLDER dash-proxy git 3 separate_proxy
python3 run_tests.py $FOLDER dash git 3
python3 run_tests.py $FOLDER dash-proxy git 4 separate_proxy
python3 run_tests.py $FOLDER dash git 4

