#!/bin/bash
vol=`grep "^/dev" /etc/mtab | grep -v " \/etc/"`
stringarray=($vol)
export IPM_VOLUME=${stringarray[1]}
export WORK_DIR="${IPM_VOLUME}/${1}"
export IPM_TEMP="/ipm-services/use-cases/tmp"
export IPM_CMDS="/ipm-services/use-cases/commands"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir $WORK_DIR
fi
export PATH=$PATH:/ipm-services:${IPM_CMDS}
chmod +x  ${IPM_CMDS}/*
cd $WORK_DIR
. ${IPM_CMDS}/alias.sh
if [ -f ${IPM_VOLUME}/export_vars.sh ]; then
  . ${IPM_VOLUME}/export_vars.sh
fi
bash
