#!/bin/bash
command="get_mqtt_servers"
resource="mqtt_servers"
tmp_directory=${IPM_TEMP}/${command}$RANDOM
mkdir $tmp_directory
echo "temp directory: ${tmp_directory}"
cat ${IPM_CMDS}/templates/get_mqtt_servers_variables.txt > ${tmp_directory}/variables.tf
cat ${IPM_CMDS}/templates/get_mqtt_servers.txt > ${tmp_directory}/main.tf
cd $tmp_directory
terraform init
terraform apply -auto-approve -var-file="${WORK_DIR}/${1}"
terraform output > $WORK_DIR/${command}_output.json
rm -rf $tmp_directory