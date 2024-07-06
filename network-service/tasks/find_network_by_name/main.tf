terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

data "ipm_networks" "networks" {
}


locals {
  found_network = [ for network in data.ipm_networks.networks.networks : network if network.state.name == var.name ]
}

output "found_network" {
  value = length(local.found_network) > 0 ? local.found_network[0] : null
}


