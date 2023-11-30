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
  networks = flatten([for network in data.ipm_networks.networks.networks : [ for leaf in network.leaf_modules : { 
      id = network.id
      href = network.href
      name = network.state.name
      modulation = network.state.operating_modulation
      actual_constellation_frequency = network.state.actual_constellation_frequency
      hub = { name = network.hub_module.state.module.module_name, id = network.hub_module.id, href = network.hub_module.href}
      leaf = { name = leaf.state.module.module_name, id = leaf.id, href = leaf.href}
  }]])

  found_network = [ for network in local.networks : network if network.hub.name == var.hub && network.leaf.name == var.leaf && (var.var.modulation == "" ? true : network.modulation == var.modulation) ]
}

output "found_network" {
  value = length(local.found_network) > 0 ? local.found_network[0] : null
}


