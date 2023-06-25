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

if [[ $# -le 2 ]]; then
  echo "Can't proceed. ${2} is not specified."
  return 1
fi

terraform init
terraform apply -auto-approve -var="${2}=${3}"
terraform output > $WORK_DIR/${1}_output.json
