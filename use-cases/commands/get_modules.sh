#!/bin/bash
#get_resources.sh $0 id "$@"
inputs="id = var.id"
vars="variable id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "id=$1"