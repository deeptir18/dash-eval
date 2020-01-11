#!/bin/bash
for i in $( seq 19 -1 0)
do
    echo "git commit -F ${CLIENT_MOUNT}/git/dash/commits/$i.commit" > commit$i.sh
done
