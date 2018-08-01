#!/bin/bash
# Requires root or sudo
# Requires the classroom.zip blob from:
# https://download.blender.org/demo/test/benchmark.zip

EXAMPLE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /tmp

find ${EXAMPLE_PATH}/ -name "*.sh" -exec chmod a+x {} \;

cd /data

curl -k -O 'https://download.blender.org/demo/test/benchmark.zip' -o /data/benchmark.zip

unzip /data/benchmark.zip
cp ${EXAMPLE_PATH}/* /data/benchmark/
mkdir -p /data/benchmark/images

chmod -R a+rwX /data/benchmark 


echo "Benchmark example staged."
echo "Go to /data/benchmark to submit the workflow."
