
if [[ $# < 3 ]]; then
  echo Missing argument.
  return 1
fi
if [ ! -d "$1" ]; then
  mkdir $1
fi
if [ $# == 3 ]; then
  sed "s/RESOURCE/$2/g;s/VAR1/$3/;s/VAR2//;s/VAR3//"  ${IPM_CMDS}/templates/get-main.txt > ${1}/main.tf
elif [ $# == 4 ]; then
  sed "s/RESOURCE/$2/g;s/VAR1/$3/;s/VAR2/$4/;s/VAR3//"  ${IPM_CMDS}/templates/get-main.txt > ${1}/main.tf
elif [ $# == 5 ]; then
  sed "s/RESOURCE/$2/g;s/VAR1/$3/;s/VAR2/$4/;s/VAR3/$5/"  ${IPM_CMDS}/templates/get-main.txt > ${1}/main.tf
fi