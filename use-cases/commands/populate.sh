
local -n arr=$1             # use nameref for indirection

if [ $# -eq 3 ]; then
  arr=("$2 = var.$2", "variable $2 { type = string }" "$2=$3")
elif [ $# -eq 5 ]; then
  arr=("$2 = var.$2\n$4 = var.$4" "variable $2 { type = string }\nvariable $4 { type = string }" "$2=$3" "$4=$5")
elif [ $# -eq 7 ]; then
  arr=("$2 = var.$2\n$4 = var.$4\n$6 = var.$6" "variable $2 { type = string }\nvariable $4 { type = string }\nvariable $6 { type = string }" "$2=$3" "$4=$5" "$6=$7")