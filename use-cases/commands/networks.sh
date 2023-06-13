#!/bin/bash

init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    init) init="$val";;
    system_data_path) system_data_path="$val";;
    profile) profile="$val";;
    intent) intent="$val";;
    *)
  esac
done

# Check intent file
if [[ ! -f ${INTENT_DIR}/${intent} -a "${1}" != "delete"]]; then
  echo "Can't proceed. Intent File ${intent} is not existed in ${INTENT_DIR}."
  return 1
fi

echo INTENT="${INTENT_DIR}/${intent}"

# Check if system profile path is set
if [[ -v system_data_path ]]; then
  export TF_VAR_system_data_path="$system_data_path"
elif [[ -v SYSTEM_DATA_PATH ]]; then
  export TF_VAR_system_data_path="${SYSTEM_DATA_PATH}"
else
  echo "Can't proceed. System data path is not specified."
  return 1
fi
echo TF_VAR_system_data_path="$TF_VAR_system_data_path"

# Check if user profile file is set
if [[ -v profile ]]; then
  export TF_VAR_user_profile="${PROFILE_DIR}/${profile}"
else
  export TF_VAR_user_profile="${PROFILE_DIR}/network_profiles.json"
fi
echo TF_VAR_user_profile="$TF_VAR_profile"

cd  ${TF_ROOT}/network-service/networks
if [ -f ${WORK_DIR}/terraform.tfstate ]; then
  cp ${WORK_DIR}/terraform.tfstate .
  cp ${WORK_DIR}/.terraform.lock.hcl .
fi
if [ "$init" = "y" -o "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

echo cmd="$1"
if [ "${1}" = "create" -o  "${1}" = "update" ]; then
  terraform apply -var-file="${INTENT_DIR}/${intent}"
elif [ "${1}" = "plan" ]; then
  terraform plan -var-file="${INTENT_DIR}/${intent}" -out=${WORK_DIR}/networks-plan.json
elif [ "${1}" = "delete" ]; then
  terraform destroy -var-file="${INTENT_DIR}/${intent}"
else
  echo "Invalid command ${1}."
  cd $WORK_DIR
  return 1
fi
if [ $? -eq 0 ]; then
  echo "0 - Terraform applied successfully"
  terraform output > ${WORK_DIR}/networks-output.json
  mv terraform.tfstate $WORK_DIR
  mv .terraform.lock.hcl $WORK_DIR
  terraform output ${WORK_DIR}/output
elif [ $? -eq 1 ]; then
  echo "1- Terraform applied failed"
elif [ $? -eq 2 ]; then
  echo "2- Terraform applied failed"
fi
cd $WORK_DIR