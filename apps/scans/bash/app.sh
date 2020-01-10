#!/bin/bash
export zannotate=/home/deeptir/go/bin/zannotate
#export filename=$CLIENT_MOUNT/2019091303_port_80.json
export filename=$CLIENT_MOUNT/scan_data/bash/test_80_40GB.json
export mrt_file=$CLIENT_MOUNT/scan_data/2019-10-12.0500.mrt
export annotated=$CLIENT_MOUNT/scan_data/bash/annotated
export as_popularity=$CLIENT_MOUNT/scan_data/bash/as_popularity
export file1=$CLIENT_MOUNT/scan_data/bash/file1
export file2=$CLIENT_MOUNT/scan_data/bash/file2

cat $filename |  $zannotate -routing -routing-mrt-file=$mrt_file -input-file-type=json > $annotated
cat $annotated | jq ".ip" | tr -d '"' > $file1
cat $annotated | jq -c ".zannotate.routing.asn" > $file2
pr -mts, $file1 $file2 | awk -F',' "{ a[\$2]++; } END { for (n in a) print n \",\" a[n] } " | sort -k2 -n -t',' -r > $as_popularity
