#!/bin/bash
export IPM_USER="xr-user-1"
export IPM_HOST="pt-xrivk824-dv"
export IPM_PASSWORD="infinera"
export IPM_VOLUME="/Work-Directory"
export WORK_DIR="${IPM_VOLUME}/${1}"
export INTENT_DIR="${WORK_DIR}/user-intents"
export PROFILE_DIR="${WORK_DIR}/user-profiles"
#export TF_ROOT=/ipm-services/apimodels/terraform-ipm-modules/use-cases
export TF_ROOT=/ipm-services/use-cases
export IPM_CMDS="${TF_ROOT}/commands"
export SYSTEM_DATA_PATH="${IPM_VOLUME}/ipm-system-data"
alias networks=". ${IPM_CMDS}/networks.sh"
alias get-modules=". ${IPM_CMDS}/get-modules.sh"
alias get-hub-module=". ${IPM_CMDS}/get-hub-module.sh"
alias get-leaf-modules=". ${IPM_CMDS}/get-leaf-modules.sh"
alias get-networks=". ${IPM_CMDS}/get-networks.sh"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir $WORK_DIR
  mkdir $INTENT_DIR
  cp ${TF_ROOT}/network-services/intents/* $INTENT_DIR
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
cd $WORK_DIR
bash
