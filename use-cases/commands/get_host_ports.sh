#!/bin/bash
#get_resources.sh $0 host_id "$@"
inputs="host_id = var.host_id"
vars="variable host_id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "host_id=$1" 