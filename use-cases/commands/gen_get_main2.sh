
if [[ $# < 3 ]]; then
  echo Missing argument.
  return 1
fi

sed "s/RESOURCE/$2/g;s/VAR/$3/"  ${IPM_CMDS}/templates/get_main2.txt > ${1}/main.tf