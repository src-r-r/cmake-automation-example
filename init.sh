#!/bin/bash


SOURCE=${BASH_SOURCE[0]}

if command -v ninja &> /dev/null; then
    BUILD_GENERATOR="-GNinja"
else 
    unset BUILD_GENERATOR
fi

while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

PROJ_ROOT=/greeting
#PROJ_ROOT=${DIR}
BUILD_DIR=$(basename ${PROJ_ROOT}/build)

set -e
printf "\033c"
cd ${PROJ_ROOT}

echo "Creating build environment"
cmake -H. -B${BUILD_DIR} -DCMAKE_BUILD_TYPE=Debug ${BUILD_GENERATOR} 2&>/dev/null

echo "Building app and test"
cmake --build ${BUILD_DIR} --clean-first
printf "\033c"
$(basename ${BUILD_DIR})/tests
set +e

