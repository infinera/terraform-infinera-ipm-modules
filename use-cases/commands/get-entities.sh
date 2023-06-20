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

if [ ! -n "$3" ]; then
  echo "Can't proceed. ${2} is not specified."
  return 1
fi

cd  ${TF_ROOT}/$1
if [ "$init" = "y" -o "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

searchstring="/"
rest=${1#*$searchstring}

terraform apply -auto-approve -var="${2}=${3}"
terraform output > $WORK_DIR/${rest}-output.json
cd $WORK_DIR
