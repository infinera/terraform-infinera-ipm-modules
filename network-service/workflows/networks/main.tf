terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
experiments = [module_variable_optional_attrs]
}

locals {
  networkMap = { for network in var.networks : network.network_name => network }
}

module "profiles"  {
  source   = "../../profiles"

  profile_path = var.profile_path
}

locals {
  leafModuleMap =  { for network in var.networks : network.network_name => network.leaf_modules }
}

module "networks" {
  source                   = "../../tasks/networks"
  depends_on               = [module.profiles]
  networks                 = var.networks
  network_profiles         = module.profiles.network_profiles
  network_config_profiles  = module.profiles.network_config_profiles
  module_config_profiles   = module.profiles.module_config_profiles
}

module "leaf_modules" {
  source                 = "../../tasks/leaf_modules"
  depends_on             = [module.networks]
  for_each               = module.networks.constellation_networks
  network_id             = each.value.id
  leaf_modules           = local.leafModuleMap[each.key]
  leaf_config_profile = local.networkMap[each.key].profile != null ? module.profiles.network_profiles[local.networkMap[each.key].profile].leaf_config_profile : null
  module_config_profiles   = module.profiles.module_config_profiles
}

data "ipm_networks" "networks" {
  depends_on = [ module.leaf_modules ]
  for_each   = module.networks.constellation_networks
    id = each.value.id
}


