#!/bin/bash
cd  ../module-management-service/get-modules
if [ ! -f ".tfinit" ]; then
  touch .tfinit
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
fi
terraform apply
cd ../..
