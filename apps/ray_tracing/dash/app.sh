cat ray_tracing/dash/logs/1.INFO | grep "\[RAY\]" | head -n1 | cut -c 7- > ray_tracing/dash/logs/rays.csv
cat ray_tracing/dash/logs/*.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- >> ray_tracing/dash/logs/rays.csv
cat ray_tracing/dash/logs/rays.csv | sed -n '/^590432,/p' > /home/deeptir/research/fs_project/dash_eval/output.log
