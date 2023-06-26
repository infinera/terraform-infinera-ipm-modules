#!/bin/bash
#get_resources.sh $0 id "$@"
inputs="module_id = var.module_id\n eclient_col_id = var.eclient_col_id\n col_id = var.col_id"
vars="variable module_id { type = string }\nvariable eclient_col_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "module_id=$1" "eclient_col_id=$2" "col_id=$3"