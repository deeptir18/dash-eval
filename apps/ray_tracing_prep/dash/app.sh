cat ray_tracing/dash/logs/*.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- >> ray_tracing/dash/logs/rays.csv
