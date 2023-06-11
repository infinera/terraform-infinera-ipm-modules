#!/bin/bash
export IPM_USER="xr-user-1"
export IPM_HOST="pt-xrivk824-dv"
export IPM_PASSWORD="infinera"
export INTENT="`pwd`/user-intents/networks.tfvars"
export USER_PROFILE="`pwd`/user-profiles/network_profiles.json"
export TF_ROOT=${HOME}/apimodels/terraform-ipm-modules/use-cases
export SYSTEM_DATA_PATH="${TF_ROOT}/ipm-data"
alias networks=". ${TF_ROOT}/commands/networks.sh"
alias get-modules=". ${TF_ROOT}/commands/get-modules.sh"
alias get-hub-module=". ${TF_ROOT}/commands/get-hub-module.sh"
alias get-leaf-modules=". ${TF_ROOT}/commands/get-leaf-modules.sh"
alias get-networks=". ${TF_ROOT}/commands/get-networks.sh"