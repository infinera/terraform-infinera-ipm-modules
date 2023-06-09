#!/bin/bash
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    force_init) force_init="$val";;
    system_data_path) system_data_path="$val";;
    user_profile_file) user_profile="$val";;
    intent_file) intent_file="$val";;
    cmd) cmd="$val";;
    *)
  esac
done

# Check intent file
if [[ ! -v intent_file ]] && [[ ! -v INTEN_FILE ]]; then
  echo "Can't proceed. Intent File is not specified."
  exit
elif [[ ! -v intent_file ]]; then
  intent_file = "$INTEN_FILE"
fi

# Check if system profile path is set
if [ -n "$system_data_path" ]; then
  export TF_VAR_system_data_path="$system_data_path"
elif [ ! -n "${SYSTEM_DATA_PATH}" ]; then
  export TF_VAR_system_data_path="${SYSTEM_DATA_PATH}"
else
  echo "Can't proceed. System data path is not specified."
  exit
fi

# Check if user profile file is set
if [ -n "$user_profile_file" ]; then
  export TF_VAR_user_profile_file="$user_profile_file"
elif [ -n "${USER_PROFILE_FILE}" ]; then
  export TF_VAR_user_profile_file="${USER_PROFILE_FILE}"
else
;;
fi
cd  ../network-service/networks
if [[ $force_init ]]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

echo $TF_VAR_user_profile_file
echo $TF_VAR_system_data_path

if [ "${cmd}" = "apply" -o  "${cmd}" = "plan"] then
  terraform $cmd -var-file="$intent_file"
else
  terraform $cmd
fi
cd ../..