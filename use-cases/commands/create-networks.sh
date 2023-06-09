#!/bin/bash
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    force_init) force_init="$val";;
    system_data_path) system_data_path="$val";;
    user_profile) user_profile="$val";;
    *)
  esac
done
cd  ../network-service/networks
if [[ $force_init ]]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit
if [ -n "$system_data_path" ]; then
  export TF_VAR_system_data_path="$system_data_path"
fi
if [ -n "$user_profile" ]; then
  export TF_VAR_user_profile="$user_profile"
fi

echo $TF_VAR_user_profile
echo $TF_VAR_system_data_path

terraform apply
cd ../..
