#!/bin/bash
#
# Requires the classroom.zip blob from:
# https://download.blender.org/demo/test/classroom.zip

mkdir -p /data/classroom/images

cd /data/classroom

qsub -N render_classroom -t 1-10 render.sh
qsub -hold_jid render_classroom convert.sh



