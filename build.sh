#!/bin/bash

cd "$(dirname $0)"

$CC --version
$CXX --version

pushd
cd "$CACHE_PATH"
python -m pip install ./ambuild
popd

mkdir build
cd build
python ../configure.py --enable-auto-versioning --enable-optimize --sdks="$SDKS" --mms-path="$CACHE_PATH/metamod-source" --hl2sdk-root="$CACHE_PATH" --sm-path="$CACHE_PATH/sourcemod"
ambuild
