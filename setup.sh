#!/bin/bash
vol=`grep "^/dev" /etc/mtab | grep -v " \/etc/"`
stringarray=($vol)
export IPM_VOLUME=${stringarray[1]}
export WORK_DIR="${IPM_VOLUME}/${1}"
#export TF_ROOT=/ipm-services/apimodels/terraform-ipm-modules/use-cases
export TF_ROOT=/ipm-services/use-cases
export IPM_CMDS="${TF_ROOT}/commands"
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
