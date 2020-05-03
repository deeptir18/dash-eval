export filename=scan_data/dash/test_80_40GB.json
export annotated=scan_data/dash/annotated
export as_popularity=scan_data/dash/as_popularity
export file1=scan_data/dash/file1
export file2=scan_data/dash/file2
export mrt_file=scan_data/2019-10-12.0500.mrt
cat $filename |  /home/deeptir/go/bin/zannotate -routing -routing-mrt-file=$mrt_file -input-file-type=json > $annotated
cat $annotated | jq ".ip" | tr -d '"' > $file1
cat $annotated | jq -c ".zannotate.routing.asn" > $file2
pr -mts, $file1 $file2 | awk -F',' "{ a[\$2]++; } END { for (n in a) print n \",\" a[n] } " | sort -k2 -n -t',' -r > $as_popularity
