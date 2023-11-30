#!/bin/bash

init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    system_profile) tc_system_profile="$val";;
    user_profile) tc_user_profile="$val";;
    *)
  esac
done

resource=$2
echo $resource
tmp_directory=${IPM_TEMP}/${resource}$RANDOM
mkdir $tmp_directory
echo "temp directory: ${tmp_directory}"

cat ${IPM_CMDS}/templates/${resource}.txt  > ${tmp_directory}/main.tf
cat ${IPM_CMDS}/templates/${resource}_variables.txt  > ${tmp_directory}/variables.tf
cd $tmp_directory

if [ "${4}" = "init" ]; then
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
if [ "$4" != "delete" -a ! -f "${WORK_DIR}/${5}" ]; then
  echo "Can't proceed. Intent File ${WORK_DIR}/${5} is not existed."
  exit 1
fi

echo INTENT="${WORK_DIR}/${5}"

# Check if system system_profile path is set
if [[ -v system_profile ]]; then
IFS=',' read -r network tc nc <<_EOF_
${system_profile}
_EOF_
  network2="$(echo -e "${network}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  tc2="$(echo -e "${tc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  nc2="$(echo -e "${nc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  export TF_VAR_network_system_profile="${IPM_SYSTEM_PROFILE}/${network2}"
  export TF_VAR_tc_system_profile="${IPM_SYSTEM_PROFILE}/${tc2}"
  export TF_VAR_nc_system_profile="${IPM_SYSTEM_PROFILE}/${nc2}"
else 
IFS=',' read -r network tc nc <<_EOF_
${3}
_EOF_
  network2="$(echo -e "${network}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  tc2="$(echo -e "${tc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  nc2="$(echo -e "${nc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  export TF_VAR_network_system_profile="${IPM_SYSTEM_PROFILE}/${network2}"
  export TF_VAR_tc_system_profile="${IPM_SYSTEM_PROFILE}/${tc2}"
  export TF_VAR_nc_system_profile="${IPM_SYSTEM_PROFILE}/${nc2}"
fi
echo TF_VAR_nc_system_profile="$TF_VAR_nc_system_profile"
echo TF_VAR_tc_system_profile="$TF_VAR_tc_system_profile"
echo TF_VAR_network_system_profile="$TF_VAR_network_system_profile"


# Check if user user_profile file is set
if [[ -v user_profile ]]; then
IFS=',' read -r network tc nc <<_EOF_
${user_profile}
_EOF_
  network2="$(echo -e "${network}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  tc2="$(echo -e "${tc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  nc2="$(echo -e "${nc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  export TF_VAR_network_user_profile="${IPM_USER_PROFILE}/${network2}"
  export TF_VAR_tc_user_profile="${IPM_USER_PROFILE}/${tc2}"
  export TF_VAR_nc_user_profile="${IPM_USER_PROFILE}/${nc2}"
else
IFS=',' read -r network tc nc <<_EOF_
${USER_PROFILE}
_EOF_
  network2="$(echo -e "${network}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  tc2="$(echo -e "${tc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  nc2="$(echo -e "${nc}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  export TF_VAR_network_user_profile="${network2}"
  export TF_VAR_tc_user_profile="${tc2}"
  export TF_VAR_nc_user_profile="${nc2}"
fi
echo TF_VAR_nc_user_profile="$TF_VAR_nc_user_profile"
echo TF_VAR_tc_user_profile="$TF_VAR_tc_user_profile"
echo TF_VAR_network_user_profile="$TF_VAR_network_user_profile"

terraform init

echo cmd="$4"
if [ "${4}" = "apply" ]; then
  if [ $resource = "networks" ]; then 
    terraform apply -auto-approve -var-file="${WORK_DIR}/${5}" -state=${WORK_DIR}/${resource}.tfstate -parallelism=1
  else
    terraform apply -auto-approve -var-file="${WORK_DIR}/${5}" -state=${WORK_DIR}/${resource}.tfstate
  fi
elif [ "${4}" = "plan" ]; then
  terraform plan -auto-approve -var-file="${WORK_DIR}/${5}" -out=${WORK_DIR}/${resource}-plan -state=${WORK_DIR}/${resource}.tfstate
elif [ "${4}" = "delete" ]; then
  terraform destroy -auto-approve -var-file="${WORK_DIR}/${5}" -state=${WORK_DIR}/${resource}.tfstate
else
  echo "Invalid command ${4}."
  #cd $WORK_DIR
  return 3
fi
if [ $? -eq 0 ]; then
  echo "0 - Terraform applied successfully"
  terraform output > ${WORK_DIR}/${resource}-output.json
elif [ $? -eq 1 ]; then
  echo "1- Terraform applied failed"
elif [ $? -eq 2 ]; then
  echo "2- Terraform applied failed"
fi
#rm -rf $tmp_directory
#cd $WORK_DIR