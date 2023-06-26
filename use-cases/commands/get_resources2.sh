#!/bin/bash
cmd=`echo "$1" | awk -F"/" '{print $NF}'`
arrIN=(${cmd//./ })
command=${arrIN[0]}
echo $command
len=${#command}-4
resource="${command:4:${len}}"
echo $resource
tmp_directory=${IPM_TEMP}/${command}$RANDOM
mkdir $tmp_directory
echo "temp directory: ${tmp_directory}"

vars=(${cmd//;/ })
. $IPM_CMDS/gen_get_main2.sh $tmp_directory $resource "$2"
. $IPM_CMDS/gen_get_variables2.sh $tmp_directory $resource "$3"
cd $tmp_directory
terraform init
if [ $# -eq 4 ]; then
  echo "terraform apply -auto-approve -var=$4"
  terraform apply -auto-approve -var="$4"
elif [ $# -eq 5 ]; then
  echo "terraform apply -auto-approve -var=$4 -var=$5"
  terraform apply -auto-approve -var="$4" -var="$5"
elif [ $# -eq 6 ]; then
  echo "terraform apply -auto-approve -var=$4 -var=$5 -var=$6"
  terraform apply -auto-approve -var="$4" -var="$5"  -var=$6
elif [ $# -eq 7 ]; then
 echo "terraform apply -auto-approve -var=$4 -var=$5 -var=$6 -var=$7"
  terraform apply -auto-approve -var="$4" -var="$5" -var="$6" -var=$7
fi
terraform output > $WORK_DIR/${command}_output.json
rm -rf $tmp_directory