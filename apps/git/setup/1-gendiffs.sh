#!/bin/bash -e

if [ $# -lt 3 ]; then
  echo "Usage: $(basename $0) REPO N OUTPUT-DIR"
  exit 1
fi

REPO_PATH=`readlink -f $1`
N=$2
OUTPUT_DIR=`readlink -f $3`

if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

pushd "$REPO_PATH"

for i in $(seq $N -1 1 )
do
    git diff HEAD~${i}..HEAD~$((${i}-1)) >"$OUTPUT_DIR/${i}-$((${i}-1)).diff"
    git log --format=%B -n 1 HEAD~$((${i}-1)) >"$OUTPUT_DIR/$((${i}-1)).commit"
done

popd
