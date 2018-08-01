#!/bin/bash
#
#$ -V
#$ -cwd
#$ -o /data/logs -e /data/logs
#$ -N convert_pabellon_barcelona_v1_mp4

cd /data/pabellon_barcelona_v1

convert -antialias -delay 1x2 -format mp4 -resize "640x480!" /data/pabellon_barcelona_v1/images/*png pabellon_barcelona_v1.mp4

