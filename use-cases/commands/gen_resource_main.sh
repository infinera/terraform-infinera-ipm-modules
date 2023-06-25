
if [[ $# < 2 ]]; then
  echo Missing argument.
  return 1
fi
if [ ! -d "$1" ]; then
  mkdir $1
fi
if [ $# == 2 ]; then
  sed "s/RESOURCES/$2/g"  ${IPM_CMDS}/templates/resource_main.txt > ${1}/main.tf
fi