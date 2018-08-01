#!/bin/bash

BLENDER_VERSION=$( jetpack config blender.version 2> /dev/null )

set -x
set -e

if [ -n "$(command -v yum)" ]; then
    yum groupinstall -y "X Window System"
    yum install -y unzip
else
    apt-get install -y xorg unzip
fi

jetpack download blender-${BLENDER_VERSION}.tar.bz2 /tmp/

cd /usr/local
tar xjf /tmp/blender-${BLENDER_VERSION}.tar.bz2
ln -sf blender-${BLENDER_VERSION} blender

cat <<EOF > /etc/profile.d/blender.sh
#!/bin/bash

export PATH=/usr/local/blender:$PATH
export LD_LIBRARY_PATH=/usr/local/blender/lib/:$LD_LIBRARY_PATH

EOF
chmod 755 /etc/profile.d/blender.sh

