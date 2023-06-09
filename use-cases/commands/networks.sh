#!/bin/bash
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    force_init) force_init="$val";;
    system_data_path) system_data_path="$val";;
    user_profile_file) user_profile="$val";;
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
if [[ ! -v intent ]] && [[ ! -v INTENT ]]; then
  echo "Can't proceed. Intent File is not specified."
  exit
elif [[ ! -v intent ]]; then
  intent="$INTENT"
fi

echo INTENt="$intent"

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
  export TF_VAR_user_profile_file="$user_profile_file"
elif [[ -v USER_PROFILE ]]; then
  export TF_VAR_user_profile="${USER_PROFILE}"
fi
echo TF_VAR_user_profile="$TF_VAR_user_profile"

cd  network-service/networks
if [[ $force_init ]]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

echo cmd="$cmd"
if [ "${cmd}" = "apply" -o  "${cmd}" = "plan" ]; then
  terraform $cmd -var-file="$intent"
else
  terraform $cmd
fi
cd ../..