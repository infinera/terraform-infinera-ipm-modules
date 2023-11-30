#!/bin/bash
#get_resources.sh $0 id "$@"
if [ $# -lt 2 ]; then
  echo "Need required argument(s)! ${0} ndu_id port_col_id [voas_col_id]"
  exit
fi
col_id="all"
if [ $# -eq 3 ]; then
  col_id=$3
fi

inputs="ndu_id = var.ndu_id\n port_col_id = var.port_col_id\n col_id = var.col_id"
vars="variable ndu_id { type = string }\nvariable port_col_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "ndu_id=$1" "port_col_id=$2" "col_id=${col_id}"