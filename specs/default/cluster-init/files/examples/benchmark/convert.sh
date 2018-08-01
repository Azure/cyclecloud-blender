#!/bin/bash
#
#$ -V
#$ -cwd
#$ -o /data/logs -e /data/logs
#$ -N convert_benchmark_mp4

cd /data/benchmark

convert -antialias -delay 1x2 -format mp4 -resize "640x480!" /data/benchmark/images/*png benchmark.mp4

