#!/bin/bash

if [ ! -n "$1" ]; then
  echo "Can't proceed. Please specify the IPM Service."
  exit
fi

if [ ! -n "$2" ]; then
  echo "Can't proceed. Please specify the working directory."
  exit
fi
export IPM_VOLUME="/Work-Directory"
export WORK_DIR="${IPM_VOLUME}/${2}"
export INTENT_DIR="${WORK_DIR}/user-intents"
export PROFILE_DIR="${WORK_DIR}/user-profiles"
#export TF_ROOT=/ipm-services/apimodels/terraform-ipm-modules/use-cases
export TF_ROOT=/ipm-services/use-cases
export IPM_CMDS="${TF_ROOT}/commands"
export SYSTEM_DATA_PATH="${IPM_VOLUME}/ipm-system-data"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir $WORK_DIR
  mkdir $INTENT_DIR
  cp ${TF_ROOT}/${1}-service/intents/* $INTENT_DIR
  mkdir $PROFILE_DIR
  cp ${TF_ROOT}/user-profiles/*  $PROFILE_DIR
fi
if [ ! -d "${IPM_VOLUME}/ipm-system-data" ]; then
  mkdir "${IPM_VOLUME}/ipm-system-data"
  cp  ${TF_ROOT}/ipm-data/* ${IPM_VOLUME}/ipm-system-data
fi

if [ ! -v "${IPM_VOLUME}/ipm-system-data/${1}_profiles.json" ]; then
  cp ${TF_ROOT}/ipm-data/${1}_profiles.json ${IPM_VOLUME}/ipm-system-data
fi

export PATH=$PATH:/ipm-services:${IPM_CMDS}
chmod +x  ${IPM_CMDS}/*
cd $WORK_DIR
. ${IPM_CMDS}/alias.sh
. ${IPM_CMDS}/credentials.sh
