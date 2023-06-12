#!/bin/bash

init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    init) init="$val";;
    system_data_path) system_data_path="$val";;
    user_profile) user_profile="$val";;
    intent) intent="$val";;
    cmd) cmd="$val";;
    *)
  esac
done

# Check Credential
if [[ -v IPM_USER ]] ; then
  export TF_VAR_ipm_user="$IPM_USER"
fi
if [[ -v IPM_HOST ]] ; then
  export TF_VAR_ipm_host="$IPM_HOST"
fi
if [[ -v IPM_PASSWORD ]] ; then
  export TF_VAR_ipm_password="$IPM_PASSWORD"
fi

# Check intent file
if [[ ! -f ${INTENT_DIR}/${intent} ]]; then
  echo "Can't proceed. Intent File ${intent} is not existed in ${INTENT_DIR}."
  exit
fi

echo INTENT="${INTENT_DIR}/${intent}"

# Check if system profile path is set
if [[ -v system_data_path ]]; then
  export TF_VAR_system_data_path="$system_data_path"
elif [[ -v SYSTEM_DATA_PATH ]]; then
  export TF_VAR_system_data_path="${SYSTEM_DATA_PATH}"
else
  echo "Can't proceed. System data path is not specified."
  exit
fi
echo TF_VAR_system_data_path="$TF_VAR_system_data_path"

# Check if user profile file is set
if [[ -v user_profile ]]; then
  export TF_VAR_user_profile="${PROFILE_DIR}/${user_profile}"
else
  export TF_VAR_user_profile="${PROFILE_DIR}/network_profiles.json"
fi
echo TF_VAR_user_profile="$TF_VAR_user_profile"

cd  ${TF_ROOT}/network-service/networks
if [ -f ${WORK_DIR}/terraform.tfstate ]; then
  cp ${WORK_DIR}/terraform.tfstate .
  cp ${WORK_DIR}/.terraform.lock.hcl .
fi
if [ "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

echo cmd="$cmd"
if [ "${cmd}" = "apply" -o  "${cmd}" = "plan" ]; then
  terraform $cmd -var-file="${INTENT_DIR}/${intent}"
else
  terraform $cmd
fi
if [ $? -eq 0 ]; then
  echo "0 - Terraform applied successfully"
  terraform output ${WORK_DIR}/output
  mv terraform.tfstate $WORK_DIR
  mv .terraform.lock.hcl $WORK_DIR
  terraform output ${WORK_DIR}/output
elif [ $? -eq 1 ]; then
  echo "1- Terraform applied failed"
elif [ $? -eq 2 ]; then
  echo "2- Terraform applied failed"
fi

cd $WORK_DIR