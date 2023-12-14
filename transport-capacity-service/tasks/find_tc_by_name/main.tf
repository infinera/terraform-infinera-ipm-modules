
data "ipm_transport_capacities" "tcs" {
}

locals {
  found-tc =[ for tc in local.tcs : tc if tc.state.name == var.name]
}

output "found-tc" {
  value = length(local.found-tc) > 0 ? local.found-tc[0] : null
}

variable name {
  type = string
}