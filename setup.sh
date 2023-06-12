#!/bin/bash
export IPM_USER="xr-user-1"
export IPM_HOST="pt-xrivk824-dv"
export IPM_PASSWORD="infinera"
export IPM_VOLUME="/Work-Directory"
export WORK_DIR="${IPM_VOLUME}/${1}"
export INTENT_DIR="${WORK_DIR}/user-intents"
export USER_PROFILE="${WORK_DIR}/user-profiles/network_profiles.json"
#export TF_ROOT=/ipm-services/apimodels/terraform-ipm-modules/use-cases
export TF_ROOT=/ipm-services/terraform-ipm-modules/use-cases
export SYSTEM_DATA_PATH="${IPM_VOLUME}/ipm-system-data"
alias networks=". ${TF_ROOT}/commands/networks.sh"
alias get-modules=". ${TF_ROOT}/commands/get-modules.sh"
alias get-hub-module=". ${TF_ROOT}/commands/get-hub-module.sh"
alias get-leaf-modules=". ${TF_ROOT}/commands/get-leaf-modules.sh"
alias get-networks=". ${TF_ROOT}/commands/get-networks.sh"
if [ ! -d "${WORK_DIR}" ]; then
  mkdir ${WORK_DIR}
  mkdir ${WORK_DIR}/user-intents
  mkdir ${WORK_DIR}/user-profiles
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
