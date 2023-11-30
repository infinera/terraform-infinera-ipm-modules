#!/bin/bash
#get_resources.sh $0 id "$@"
if [ $# -lt 3 ]; then
  echo "Need required argument(s)! ${0} ndu_id port_col_id line_ptp_col_id [carrier_col_id]"
  exit
fi
col_id="all"
if [ $# -eq 4 ]; then
  col_id=$4
fi

inputs="ndu_id = var.ndu_id\n port_col_id = var.port_col_id\n line_ptp_col_id = var.line_ptp_col_id\n col_id = var.col_id"
vars="variable ndu_id { type = string }\nvariable port_col_id { type = string }\nvariable line_ptp_col_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "ndu_id=$1" "port_col_id=$2" "line_ptp_col_id=$3" "col_id=${col_id}"