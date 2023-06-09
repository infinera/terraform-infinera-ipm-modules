#!/bin/bash
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    force_init) force_init="$val";;
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

cd  network-service/get-hub-module
if [[ $force_init ]]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit
terraform apply -auto-approve -var="network_id=${id}"
cd ../..
