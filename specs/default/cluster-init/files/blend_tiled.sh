#!/bin/bash
#
#$ -t 1:128

BLEND_FILE=${1}
TILE_NUM=${SGE_TASK_ID}


blender -b ${BLEND_FILE} -o ${BLEND_FILE}_ -F EXR -f 1 -- --cycles-resumable-num-chunks 128 --cycles-resumable-current-chunk ${TILE_NUM}
