#!/bin/bash
#
# Requires the pabellon_barcelona_v1.scene_.zip blob from:
# https://download.blender.org/demo/test/pabellon_barcelona_v1.scene_.zip

mkdir -p /data/pabellon_barcelona_v1/images

cd /data/pabellon_barcelona_v1

qsub -N render_pabellon_barcelona_v1 -t 1-10 render.sh
qsub -hold_jid render_pabellon_barcelona_v1 convert.sh



