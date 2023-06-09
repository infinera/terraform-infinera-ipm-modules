terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {
  system_profiles = fileexists("${var.system_data_path}/network_profiles.json") ? jsondecode(file("${var.system_data_path}/network_profiles.json")) : { network_profiles : {}, network_config_profiles : {}, module_config_profiles : {} }

  user_profiles = fileexists("${var.user_data_path}/network_profiles.json") ? jsondecode(file("${var.user_data_path}/network_profiles.json")) : fileexists("${path.root}/network_profiles.json") ? jsondecode(file("${path.root}/network_profiles.json")) :  { network_profiles : {}, network_config_profiles : {}, module_config_profiles : {} }

  network_profiles        = merge(local.user_profiles.network_profiles, local.system_profiles.network_profiles)
  network_config_profiles = merge(local.user_profiles.network_config_profiles, local.system_profiles.network_config_profiles)
  module_config_profiles  = merge(local.user_profiles.module_config_profiles, local.system_profiles.module_config_profiles)
}

// type = map(object({network_config_profile = optional(string), hub_config_profile= optional(string), leaf_config_profile= optional(string)}))
output "network_profiles" {
  value = local.network_profiles
}

//type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
output "network_config_profiles" {
  value = local.network_config_profiles
}

//type = map(object({traffic_mode= optional(string),fiber_connection_mode= optional(string), managed_by= optional(string), planned_capacity= optional(string), requested_nominal_psd_offset= optional(string), fec_iterations= optional(string), tx_clp_target= optional(string)}))
output "module_config_profiles" {
  value = local.module_config_profiles
}
