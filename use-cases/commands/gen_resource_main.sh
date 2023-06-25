
if [[ $# < 3 ]]; then
  echo Missing argument.
  return 1
fi
if [ ! -d "$1" ]; then
  mkdir $1
fi
sed "s/SERVICE/$2/;s/RESOURCES/$3/g"  ${IPM_CMDS}/templates/resource_main.txt > ${1}/main.tf