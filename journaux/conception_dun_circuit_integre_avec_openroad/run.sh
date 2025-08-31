#!/usr/bin/env bash
set -ex

#DESIGN_NAME='picorv32'
DESIGN_NAME='picosoc_flat'
PLATFORM='asap7'
BASE_DIR=$(pwd)

export DESIGN_HOME=$BASE_DIR/designs
export DESIGN_CONFIG=$DESIGN_HOME/$PLATFORM/$DESIGN_NAME/config.mk
export WORK_HOME=$BASE_DIR/work

if [ $# -eq 0 ]; then
    TARGET="all"
else
    TARGET="$@"
fi

exec make \
    -C $BASE_DIR/openroad-flow-scripts/flow \
    $TARGET