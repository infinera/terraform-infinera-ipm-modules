if [[ $# < 2 ]]; then
  echo Missing argument.
  return 1
fi

sed "s/VAR/$3/"  ${IPM_CMDS}/templates/get_variables2.txt > ${1}/variables.tf