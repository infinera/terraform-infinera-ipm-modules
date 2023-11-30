#!/bin/bash
vol=`grep "^/dev" /etc/mtab | grep -v " \/etc/"`
stringarray=($vol)
export IPM_VOLUME="${stringarray[1]}"
export IPM_WORKSPACE="${IPM_VOLUME}/workSpace"
if [ ! -d "${IPM_WORKSPACE}" ]; then
  mkdir $IPM_WORKSPACE
fi

export WORK_DIR="${IPM_WORKSPACE}/${1}"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir $WORK_DIR
fi

export IPM_SOURCE="/ipm-services"
export IPM_TF="${IPM_SOURCE}/use-cases"

export IPM_TEMP="${IPM_TF}/tmp"
if [ ! -d "${IPM_TEMP}" ]; then
  mkdir $IPM_TEMP
fi

export IPM_CMDS="${IPM_TF}/commands"
if [ ! -f ${WORK_DIR}/aliases.sh ]; then
  cp ${IPM_CMDS}/aliases.sh $WORK_DIR
fi

export IPM_SYSTEM_PROFILE="${IPM_WORKSPACE}/system-profiles"
if [ ! -d $IPM_SYSTEM_PROFILE ]; then
  cp -rf ${IPM_TF}/system-profiles $IPM_SYSTEM_PROFILE
fi

export IPM_USER_PROFILE="${IPM_WORKSPACE}/user-profiles"
if [ ! -d $IPM_USER_PROFILE ]; then
  cp -rf ${IPM_TF}/user-profiles $IPM_USER_PROFILE
fi

export IPM_USER_INTENT="${IPM_WORKSPACE}/user-intents"
if [ ! -d $IPM_USER_INTENT ]; then
  cp -rf ${IPM_TF}/user-intents $IPM_USER_INTENT
fi

export PATH=$PATH:${IPM_SOURCE}:${IPM_CMDS}
chmod +x  ${IPM_CMDS}/*
cd $WORK_DIR
bash
