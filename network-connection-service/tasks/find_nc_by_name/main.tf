terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }

  }
}

provider "ipm" {
  username = "xr-user-1"
  password = "infinera"
  host     = "ipm-eval2.westus3.cloudapp.azure.com"
}

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

