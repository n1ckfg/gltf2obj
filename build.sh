#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd "$DIR"

git clone https://github.com/google/draco

cd draco

mkdir build_dir && cd build_dir
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release

cd ..

mkdir build_dir && cd build_dir
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
