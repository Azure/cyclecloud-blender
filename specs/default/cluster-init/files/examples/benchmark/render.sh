#!/bin/bash
#
#$ -V
#$ -cwd
#$ -o /data/logs -e /data/logs
#$ -N render_benchmark

mkdir -p /data/benchmark/images

blender -b benchmark.blend -o /data/benchmark/images/frame_ -f ${SGE_TASK_ID}

