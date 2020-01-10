#!/bin/bash
for i in $( seq 19 -1 0)
do
    echo "git commit -F /home/deeptir/mnt/dash_server/git/dash/commits/$i.commit" > commit$i.sh
done
