#!/bin/bash
#
# Requires the benchmark.zip blob from:
# https://download.blender.org/demo/test/benchmark.zip

mkdir -p /data/benchmark/images

cd /data/benchmark

qsub -N render_benchmark -t 1-10 render.sh
qsub -hold_jid render_benchmark convert.sh



