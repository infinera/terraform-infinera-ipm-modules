#!/bin/bash
#get_resources.sh $0 id "$@"
if [ $# -lt 3 ]; then
  echo "Need required argument(s)! ${0} module_id line_ptp_col_id carrier_col_id [dsc_col_id]"
  return 1
fi
col_id="all"
if [ $# -eq 4 ]; then
  col_id=$4
fi

inputs="module_id = var.module_id\n line_ptp_col_id = var.line_ptp_col_id\n carrier_col_id = var.carrier_col_id\\n col_id = var.col_id"
vars="variable module_id { type = string }\nvariable line_ptp_col_id { type = string }\nvariable carrier_col_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "module_id=$1" "line_ptp_col_id=$2" "carrier_col_id=$3" "col_id=${col_id}"