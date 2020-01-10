#!/bin/bash
source config.sh
python results_sync dash ray_tracing 0
python results_sync bash ray_tracing 0
python results_sync dash images 0
python results_sync bash images 0
python results_sync bash ray_tracing 1
python results_sync dash ray_tracing 1
python results_sync bash images 1
python results_sync dash images 1
python results_sync dash ray_tracing 2
python results_sync bash ray_tracing 2
python results_sync dash images 2
python results_sync bash images 2
python results_sync dash ray_tracing 3
python results_sync bash ray_tracing 3
python results_sync dash images 3
python results_sync bash images 3
python results_sync dash ray_tracing 4
python results_sync bash ray_tracing 4
python results_sync dash images 4
python results_sync bash images 4

## run the ASYNCHRONOUS tests
source config_async.sh
python results_async dash ray_tracing 0
python results_async bash ray_tracing 0
python results_async dash images 0
python results_async bash images 0
python results_async bash ray_tracing 1
python results_async dash ray_tracing 1
python results_async bash images 1
python results_async dash images 1
python results_async dash ray_tracing 2
python results_async bash ray_tracing 2
python results_async dash images 2
python results_async bash images 2
python results_async dash ray_tracing 3
python results_async bash ray_tracing 3
python results_async dash images 3
python results_async bash images 3
python results_async dash ray_tracing 4
python results_async bash ray_tracing 4
python results_async dash images 4
python results_async bash images 4

## run the scans
source config.sh
python results_sync dash scans 0
python results_sync bash scans 0

source config_async.sh
python results_async dash scans 0
python results_async bash scans 0
python results_async dash scans 1
python results_async bash scans 1

source config.sh
python results_sync dash scans 0
python results_sync bash scans 0

