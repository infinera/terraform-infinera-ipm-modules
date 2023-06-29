#!/bin/bash
#get_resources.sh $0 host_id "$@"
if [ $# -lt 1 ]; then
  echo "Need required argument(s)! ${0} host_id"
  exit  
fi
inputs="host_id = var.host_id"
vars="variable host_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "host_id=$1" 