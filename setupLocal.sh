#!/bin/bash
export IPM_VOLUME=$HOME/apimodels
export WORK_DIR="${IPM_VOLUME}/${1}"
export IPM_CMDS="${IPM_VOLUME}/terraform-ipm-modules/use-cases/commands"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir $WORK_DIR
fi
export PATH=$PATH:$IPM_CMDS
chmod +x  ${IPM_CMDS}/*
cd $WORK_DIR
. ${IPM_CMDS}/alias.sh
if [ -f ${IPM_VOLUME}/export_vars.sh ]; then
  . ${IPM_VOLUME}/export_vars.sh
fi
bash
