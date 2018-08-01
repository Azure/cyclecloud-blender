#!/bin/bash
# Requires root or sudo
# Requires the classroom.zip blob from:
# https://download.blender.org/demo/test/pabellon_barcelona_v1.scene_.zip

EXAMPLE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /tmp

find ${EXAMPLE_PATH}/ -name "*.sh" -exec chmod a+x {} \;

mkdir -p /data/pabellon_barcelona_v1
cd /data/pabellon_barcelona_v1

curl -k -O 'https://download.blender.org/demo/test/pabellon_barcelona_v1.scene_.zip' -o /data/pabellon_barcelona_v1/pabellon_barcelona_v1.scene_.zip

unzip /data/pabellon_barcelona_v1/pabellon_barcelona_v1.scene_.zip
cp ${EXAMPLE_PATH}/* /data/pabellon_barcelona_v1/
mkdir -p /data/pabellon_barcelona_v1/images

chmod -R a+rwX /data/pabellon_barcelona_v1


echo "Pabellon Barcelona example staged."
echo "Go to /data/pabellon_barcelona_v1 to submit the workflow."
