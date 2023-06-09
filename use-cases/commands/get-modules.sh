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
cd  module-management-service/get-modules
if [[ $force_init ]]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit
terraform apply -auto-approve 
cd ../..
