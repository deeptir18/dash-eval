export filename=/home/deeptir/research/mnt/dash_mount/scans/scan_data.txt
export mrt_file=/home/deeptir/research/mnt/dash_mount/scans/mrt_file.txt
cat $filename |  $zannotate -routing -routing-mrt-file=$mrt_file -input-file-type=json > annotated

