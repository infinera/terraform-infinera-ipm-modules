if [[ $# < 2 ]]; then
  echo Missing argument.
  return 1
fi

if [ $# == 3 ]; then
  sed "s/VAR1/$3/;s/VAR2/ /;s/VAR3/ /"  ${IPM_CMDS}/templates/get_variables.txt > ${1}/variables.tf
elif [ $# == 4 ]; then
  sed "s/VAR1/$2/;s/VAR2/\$3/;s/VAR3/ /"  ${IPM_CMDS}/templates/get_variables.txt > ${1}/variables.tf
elif [ $# == 5 ]; then
  sed "s/VAR1/$2/;s/VAR2/$3/;s/VAR3/$4/"  ${IPM_CMDS}/templates/get_variables.txt > ${1}/variables.tf
fi