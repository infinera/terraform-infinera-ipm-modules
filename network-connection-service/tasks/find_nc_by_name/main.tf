terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

data "ipm_network_connections" "ncs" {
}

locals {
  found_nc =[ for nc in  data.ipm_network_connections.ncs.ncs : nc if nc.state.name == var.name]
}

output "found_nc" {
  value = length(local.found_nc) > 0 ? local.found_nc[0] : null
}

variable name {
  type = string
}

