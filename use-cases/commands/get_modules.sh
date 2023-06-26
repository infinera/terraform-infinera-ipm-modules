#!/bin/bash
#get_resources.sh $0 id "$@"
id="all"
if [ $# -eq 1 ]; then
  id=$1
fi
inputs="id = var.id"
vars="variable id { type = string }"
get_resources2.sh $0 "$inputs" "$vars" "id=${id}"