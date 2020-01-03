#!/bin/bash -e

if [ $# -lt 3 ]; then
  echo "Usage: $(basename $0) REPO INPUT-DIR N"
  exit 1
fi

REPO_PATH=`readlink -f $1`
INPUT_DIR=`readlink -f $2`
N=$3

pushd ${REPO_PATH}

patch -p1 <"${INPUT_DIR}/${N}-$((${N}-1)).diff"

git status
git add .
git commit -F - <"${INPUT_DIR}/$((${N}-1)).commit"

popd
