#!/bin/bash
#get_resources.sh $0 id "$@"
if [ $# -lt 2 ]; then
  echo "Need required argument! ${0} module_id otu_col_id [odu_col_id]"
  exit
fi
col_id="all"
if [ $# -eq 3 ]; then
  col_id=$3
fi

inputs="module_id = var.module_id\n otu_col_id = var.otu_col_id\n col_id = var.col_id"
vars="variable module_id { type = string }\nvariable otu_col_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "module_id=$1" "otu_col_id=$2" "col_id=${col_id}"