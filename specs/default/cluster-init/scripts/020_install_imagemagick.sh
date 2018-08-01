#!/bin/bash

set -e
set -x

if [ -n "$(command -v yum)" ]; then
    rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    yum install -y ffmpeg imagemagick
else
    apt-get install -y ffmpeg imagemagick
fi



