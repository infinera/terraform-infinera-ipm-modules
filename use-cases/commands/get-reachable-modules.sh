#!/bin/bash
init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    init) init="$val";;
    network_id) network_id="$val";;
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
if [[ ! -v network_id ]]; then
  echo "Can't proceed. Network id is not specified."
  exit
fi

cd  ${TF_ROOT}/network-service/get-reachable-modules
if [ "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

terraform apply -auto-approve -var="network_id=${network_id}"
terraform output > $WORK_DIR/get-reachable-modules-output.json
cd $WORK_DIR
