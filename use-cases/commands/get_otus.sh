#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Need required argument! ${0} module_id [OTU_col_id]"
  return 1
fi
col_id="all"
if [ $# -eq 2 ]; then
  col_id=$2
fi
inputs="module_id = var.module_id\n col_id = var.col_id"
vars="variable module_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "module_id=$1" "col_id=${col_id}"