
data "ipm_network_connections" "ncs" {
}

locals {
  found_nc =[ for nc in local.ncs : nc if nc.state.name == var.name]
}

output "found_nc" {
  value = length(local.found_nc) > 0 ? local.found_nc[0] : null
}

variable name {
  type = string
}

