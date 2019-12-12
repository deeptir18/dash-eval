#!/bin/bash
export filename=/home/deeptir/research/mnt/dash_mount/scans/scan_data.txt
export mrt_file=/home/deeptir/research/mnt/dash_mount/scans/mrt_file.txt
cat $filename |  $zannotate -routing -routing-mrt-file=$mrt_file -input-file-type=json > annotated
pr -mts, <( cat annotated | jq ".ip" | tr -d '"') <( cat annotated | jq -c ".zannotate.routing.asn" ) | awk -F',' '{ a[$2]++; } END { for (n in a) print n "," a[n] } ' | sort -k2 -n -t',' -r > as_popularity
