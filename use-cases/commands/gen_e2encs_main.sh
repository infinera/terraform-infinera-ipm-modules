echo "****IPM_SOURCE = ${IPM_SOURCE}"
sed "s/IPM_SOURCE/${IPM_SOURCE}/g"  ${IPM_CMDS}/templates/e2e_ncs.txt > ${1}/main.tf