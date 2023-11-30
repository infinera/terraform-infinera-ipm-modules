#!/bin/bash

init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    recover) recover="$val";;
    system_profile) system_profile="$val";;
    user_profile) user_profile="$val";;
    *)
  esac
done

resource=$2
echo $resource
tmp_directory=${IPM_TEMP}/${resource}$RANDOM
mkdir $tmp_directory
echo "temp directory: ${tmp_directory}"

. ${IPM_CMDS}/gen_resource_main.sh $tmp_directory $1 $resource
cat ${IPM_CMDS}/templates/${resource}_variables.txt  > ${tmp_directory}/variables.tf
cd $tmp_directory

if [ "${4}" = "init" ]; then
  read -p "'init' setting will cleanup all the TF state file. Do you want to continue (y/n)?" response
  if [[ $response =~ ^(n| ) ]]; then
    exit 10
  fi
  if [ -f ${WORK_DIR}/${resource}.tfstate ]; then
    mv ${WORK_DIR}/${resource}.tfstate ${WORK_DIR}/${resource}.tfstate.save;
  fi
  rm ./.terraform.lock.hcl; 
  exit 0
elif [ "$4" = "recover" ]; then
  mv ${WORK_DIR}/${resource}.tfstate.save ${WORK_DIR}/${resource}.tfstate;
  exit 0
fi

# Check intent file
if [ "$4" != "delete" -a ! -f "${IPM_USER_INTENT}/${5}" ]; then
  echo "Can't proceed. Intent File ${IPM_USER_INTENT}/${5} is not existed."
  exit 1
fi

echo INTENT="${IPM_USER_INTENT}/${5}"

# Check if system system_profile path is set
if [[ -v system_profile ]]; then
  export TF_VAR_system_profile="${IPM_SYSTEM_PROFILE}/${system_profile}"
else 
  export TF_VAR_system_profile="${IPM_SYSTEM_PROFILE}/${3}"
fi
echo TF_VAR_system_profile="$TF_VAR_system_profile"
#echo content of $TF_VAR_system_profile
#cat $TF_VAR_system_profile

# Check if user user_profile file is set
if [[ -v user_profile ]]; then
  export TF_VAR_user_profile="${IPM_USER_PROFILE}/${user_profile}"
else
  export TF_VAR_user_profile="${USER_PROFILE}"
fi
echo TF_VAR_user_profile="$TF_VAR_user_profile"

  
terraform init

echo cmd="$4"
if [ "${4}" = "apply" ]; then
  if [ $resource = "networks" ]; then 
    terraform apply -var-file="${IPM_USER_INTENT}/${5}" -state=${WORK_DIR}/${resource}.tfstate -parallelism=1
  else
    terraform apply -var-file="${IPM_USER_INTENT}/${5}" -state=${WORK_DIR}/${resource}.tfstate
  fi
elif [ "${4}" = "plan" ]; then
  terraform plan -var-file="${IPM_USER_INTENT}/${5}" -out=${WORK_DIR}/${resource}-plan -state=${WORK_DIR}/${resource}.tfstate
elif [ "${4}" = "delete" ]; then
  terraform destroy -var-file="${IPM_USER_INTENT}/${5}" -state=${WORK_DIR}/${resource}.tfstate
else
  echo "Invalid command ${4}."
  #cd $WORK_DIR
  return 3
fi
if [ $? -eq 0 ]; then
  echo "0 - Terraform applied successfully"
  terraform output -state=${WORK_DIR}/${resource}.tfstate > ${WORK_DIR}/${resource}_output.json
elif [ $? -eq 1 ]; then
  echo "1- Terraform applied failed"
elif [ $? -eq 2 ]; then
  echo "2- Terraform applied failed"
fi
#rm -rf $tmp_directory
#cd $WORK_DIR