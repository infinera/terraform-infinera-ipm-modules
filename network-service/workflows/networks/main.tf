terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~> 0.4.0"
    }
  }
}

locals {
  networkMap = { for network in var.networks : (network.hub_module.identifier.module_name != null ? network.hub_module.identifier.module_name : network.hub_module.identifier.module_id != null ? network.hub_module.identifier.module_id : network.hub_module.identifier.serial_number != null ? network.hub_module.identifier.serial_number : network.hub_module.identifier.mac_address != null ? network.hub_module.identifier.mac_address : network.value.hub_module.identifier.host_name == null ? network.value.hub_module.identifier.host_name : network.value.hub_module.identifier.host_port_id != null ? network.value.hub_module.identifier.host_port_id : network.value.hub_module.identifier.host_sys_name != null ? network.value.hub_module.identifier.host_sys_name : network.value.hub_module.identifier.host_port_source_mac != null ? network.value.hub_module.identifier.host_port_source_mac : "") => network }

  leafModuleMap = { for network in var.networks : (network.hub_module.identifier.module_name != null ? network.hub_module.identifier.module_name : network.hub_module.identifier.module_id != null ? network.hub_module.identifier.module_id : network.hub_module.identifier.serial_number != null ? network.hub_module.identifier.serial_number : network.hub_module.identifier.mac_address != null ? network.hub_module.identifier.mac_address : network.value.hub_module.identifier.host_name == null ? network.value.hub_module.identifier.host_name : network.value.hub_module.identifier.host_port_id != null ? network.value.hub_module.identifier.host_port_id : network.value.hub_module.identifier.host_sys_name != null ? network.value.hub_module.identifier.host_sys_name : network.value.hub_module.identifier.host_port_source_mac != null ? network.value.hub_module.identifier.host_port_source_mac : "") => network.leaf_modules }
}

module "profiles" {
  source = "../../profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "networks" {
  source                  = "../../tasks/networks"
  depends_on              = [module.profiles]
  networks                = var.networks
  network_profiles        = module.profiles.network_profiles
  network_config_profiles = module.profiles.network_config_profiles
  module_config_profiles  = module.profiles.module_config_profiles
}

module "leaf_modules" {
  source                 = "../../tasks/leaf_modules"
  depends_on             = [module.networks]
  for_each               = module.networks.constellation_networks
  network_id             = each.value.id
  leaf_modules           = local.leafModuleMap[each.key]
  leaf_config_profile    = local.networkMap[each.key].profile != null ? module.profiles.network_profiles[local.networkMap[each.key].profile].leaf_config_profile : null
  module_config_profiles = module.profiles.module_config_profiles
}

data "ipm_networks" "networks" {
  depends_on = [module.leaf_modules]
  for_each   = module.networks.constellation_networks
  id         = each.value.id
}


