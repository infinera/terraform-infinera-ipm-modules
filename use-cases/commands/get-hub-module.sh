#!/bin/bash
init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    init) init="$val";;
    *)
  esac
done

if [ ! -n "$1" ]; then
  echo "Can't proceed. Network id is not specified."
  return 1
fi

cd  ${TF_ROOT}/network-service/get-hub-module
if [ "$init" = "y" -o "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

terraform apply -auto-approve -var="network_id=${1}"
terraform output > $WORK_DIR/get-hub-module-output.json
cd $WORK_DIR
