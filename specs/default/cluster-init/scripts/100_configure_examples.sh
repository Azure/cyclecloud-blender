#!/bin/bash

set -e
set -x

cd /tmp

find ${CYCLECLOUD_SPEC_PATH}/files/examples/ -name "*.sh" -exec chmod a+x {} \;






