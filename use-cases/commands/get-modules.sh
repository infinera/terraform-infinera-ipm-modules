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

cd  ${TF_ROOT}/module-management-service/get-modules
if [ "$init" = "y" || "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

terraform apply -auto-approve 
terraform output > $WORK_DIR/get-modules-output.json
cd $WORK_DIR
