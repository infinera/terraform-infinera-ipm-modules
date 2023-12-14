
module "system_profile" {
  source = "../../common/get_profiles"

  profile = var.system_profile
  
}

module "user_profile" {
  source = "../../common/get_profiles"

  profile = var.user_profile
  
}

locals {
  system_profiles = length(module.system_profile.profiles) > 0 ? module.system_profile.profiles : { network_profiles : {}, network_config_profiles : {}, module_config_profiles : {} }

  user_profiles = length(module.user_profile.profiles) > 0 ? module.user_profile.profiles : { network_profiles : {}, network_config_profiles : {}, module_config_profiles : {} }

  network_profiles        = merge(local.user_profiles.network_profiles, local.system_profiles.network_profiles)
  network_config_profiles = merge(local.user_profiles.network_config_profiles, local.system_profiles.network_config_profiles)
  module_config_profiles  = merge(local.user_profiles.module_config_profiles, local.system_profiles.module_config_profiles)
}


// Network- Profile : type = map(object({network_config_profile = optional(string), hub_config_profile= optional(string), leaf_config_profile= optional(string)}))
output "network_profiles" {
  value = local.network_profiles
}

//Network Config Profile - type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
output "network_config_profiles" {
  value = local.network_config_profiles
}

//Module-config profile: type = map(object({traffic_mode= optional(string),fiber_connection_mode= optional(string), managed_by= optional(string), planned_capacity= optional(string), requested_nominal_psd_offset= optional(string), fec_iterations= optional(string), tx_clp_target= optional(string)}))
output "module_config_profiles" {
  value = local.module_config_profiles
}
