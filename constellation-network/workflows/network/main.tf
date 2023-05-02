terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  networkMap = { for network in var.networks : network.name => network }
}

module "ns_profiles"  {
  source   = "../../profiles/ns_profiles"
}

locals {
  leafModuleMap =  { for network in var.networks : network.name => network.leaf_modules }
}

module "network" {
  source                   = "../../tasks/network"
  depends_on               = [module.ns_profiles]
  networks                 = var.networks
  network_profiles         = module.ns_profiles.network_profiles
  network_config_profiles  = module.ns_profiles.network_config_profiles
  module_config_profiles   = module.ns_profiles.module_config_profiles
}

module "leaf_module" {
  source                 = "../../tasks/leaf_module"
  depends_on             = [module.network]
  for_each               = module.network.constellation_networks
  network_id             = each.value.id
  leaf_modules           = local.leafModuleMap[each.key]
  network_config_profile = module.ns_profiles.module_config_profiles[module.ns_profiles.network_profiles[local.networkMap[each.key].network_profile].leaf_config_profile]
  module_config_profiles   = module.ns_profiles.module_config_profiles
}


