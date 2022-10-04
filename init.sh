#!/bin/bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

PROJ_ROOT=/greeting
BUILD_DIR=${PROJ_ROOT}/build

set -e
printf "\033c"
mkdir -p ${BUILD_DIR} # create if it doesn't exist
cd ${BUILD_DIR}
cmake -DDEBUG=1 ..
printf "\033c"
make
printf "\033c"
./tests
set +e
