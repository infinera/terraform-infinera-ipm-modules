#!/bin/bash
vol=`grep "^/dev" /etc/mtab | grep -v " \/etc/"`
stringarray=($vol)
export WORK_DIR="${stringarray[1]}"

export IPM_SOURCE="/ipm-services"
export IPM_TF="${IPM_SOURCE}/use-cases"

export IPM_TEMP="${IPM_TF}/tmp"
if [ ! -d "${IPM_TEMP}" ]; then
  mkdir $IPM_TEMP
fi

export IPM_CMDS="${IPM_TF}/commands"

export IPM_SYSTEM_PROFILE="${WORK_DIR}/system-profiles"
if [ ! -d $IPM_SYSTEM_PROFILE ]; then
  cp -rf ${IPM_TF}/system-profiles $IPM_SYSTEM_PROFILE
fi

export PATH=$PATH:${IPM_SOURCE}:${IPM_CMDS}
chmod +x  ${IPM_CMDS}/*
cd $WORK_DIR
${1} ${2} ${3} ${4} ${5} ${6}
