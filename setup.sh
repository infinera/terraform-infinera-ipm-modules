#!/bin/bash
export TF_VAR_ipm_user="xr-user-1"
export TF_VAR_ipm_host="pt-xrivk824-dv"
export TF_VAR_ipm_password="infinera"
export IPM_VOLUME="/Work-Directory"
export WORK_DIR="${IPM_VOLUME}/${1}"
export INTENT_DIR="${WORK_DIR}/user-intents"
export PROFILE_DIR="${WORK_DIR}/user-profiles"
#export TF_ROOT=/ipm-services/apimodels/terraform-ipm-modules/use-cases
export TF_ROOT=/ipm-services/use-cases
export IPM_CMDS="${TF_ROOT}/commands"
export SYSTEM_DATA_PATH="${IPM_VOLUME}/ipm-system-data"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir $WORK_DIR
  mkdir $INTENT_DIR
  cp ${TF_ROOT}/network-service/intents/* $INTENT_DIR
  mkdir $PROFILE_DIR
  cp ${TF_ROOT}/user-profiles/*  $PROFILE_DIR
fi
if [ ! -d "${IPM_VOLUME}/ipm-system-data" ]; then
  mkdir "${IPM_VOLUME}/ipm-system-data"
  cp  ${TF_ROOT}/ipm-data/* ${IPM_VOLUME}/ipm-system-data
fi

if [ ! -v "${IPM_VOLUME}/ipm-system-data/network_profiles" ]; then
  cp ${TF_ROOT}/ipm-data/network_profiles.json ${IPM_VOLUME}/ipm-system-data
fi

export PATH=$PATH:/ipm-services:${IPM_CMDS}
chmod +x  ${IPM_CMDS}/*
cd $WORK_DIR
. ${IPM_CMDS}/alias.sh
