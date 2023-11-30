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

data "ipm_networks" "networks" {
}


locals {
  found_network = [ for network in local.networks : network if network.state.name == var.name ]
}

output "found_network" {
  value = length(local.found_network) > 0 ? local.found_network[0] : null
}


