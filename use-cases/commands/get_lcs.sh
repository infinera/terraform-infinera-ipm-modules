#!/bin/bash
inputs="module_id = var.module_id\n col_id = var.col_id"
vars="variable module_id { type = string }\nvariable col_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "module_id=$1" "col_id=$2"