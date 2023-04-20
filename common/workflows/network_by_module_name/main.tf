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

module "network_only_by_module_name" {
  source                   = "../../tasks/network_only_by_module_name"
  networks                 = var.networks
  network_profiles         = module.ns_profiles.network_profiles
  network_config_profiles  = module.ns_profiles.network_config_profiles
  module_config_profiles   = module.ns_profiles.module_config_profiles
}

module "leaf_module_by_module_name" {
  source                 = "../../tasks/leaf_module_by_module_name"
  depends_on             = [module.network_only_by_module_name]
  for_each               = module.network_only_by_module_name.networks
  network_id             = each.value.id
  leaf_modules           = var.leaf_modules[each.key]
  network_config_profile = module.ns_profiles.module_config_profiles[module.ns_profiles.network_profiles[local.networkMap[each.key].network_profile].leaf_config_profile]
  module_config_profiles   = module.ns_profiles.module_config_profiles
}

