#!/bin/bash
#
#$ -V
#$ -cwd
#$ -o /data/logs -e /data/logs
#$ -N convert_classroom_mp4

cd /data/classroom

convert -antialias -delay 1x2 -format mp4 -resize "640x480!" /data/classroom/images/*png classroom.mp4

