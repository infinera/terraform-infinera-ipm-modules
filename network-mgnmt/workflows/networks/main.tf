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

module "profiles"  {
  source   = "../../profiles"
}

locals {
  leafModuleMap =  { for network in var.networks : network.name => network.leaf_modules }
}

module "network" {
  source                   = "../../tasks/networks"
  depends_on               = [module.profiles]
  networks                 = var.networks
  network_profiles         = module.profiles.network_profiles
  network_config_profiles  = module.profiles.network_config_profiles
  module_config_profiles   = module.profiles.module_config_profiles
}

module "leaf_module" {
  source                 = "../../tasks/leaf_modules"
  depends_on             = [module.network]
  for_each               = module.network.constellation_networks
  network_id             = each.value.id
  leaf_modules           = local.leafModuleMap[each.key]
  leaf_config_profile = local.networkMap[each.key].profile != null ? module.profiles.network_profiles[local.networkMap[each.key].profile].leaf_config_profile : null
  module_config_profiles   = module.profiles.module_config_profiles
}

data "ipm_networks" "networks" {
  depends_on = [ module.leaf_module ]
  for_each   = module.network.constellation_networks
    id = each.value.id
}


