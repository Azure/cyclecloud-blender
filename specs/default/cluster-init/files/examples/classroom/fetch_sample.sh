#!/bin/bash
# Requires root or sudo
# Requires the classroom.zip blob from:
# https://download.blender.org/demo/test/classroom.zip

EXAMPLE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /tmp

find ${EXAMPLE_PATH}/ -name "*.sh" -exec chmod a+x {} \;

cd /data

curl -k -O 'https://download.blender.org/demo/test/classroom.zip' -o /data/classroom.zip

unzip /data/classroom.zip
cp ${EXAMPLE_PATH}/* /data/classroom/
mkdir -p /data/classroom/images

chmod -R a+rwX /data/classroom


echo "Classroom example staged."
echo "Go to /data/classroom to submit the workflow."
