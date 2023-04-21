terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_network_profiles = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}, 
    "network_profile2" = { network_config_profile: "network_config_profile2", hub_config_profile: "hub_profile2", leaf_config_profile:"leaf_profile2"},
  }
  system_network_config_profiles = {
    "network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
    "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
  }

  system_module_config_profiles = { 
    "hub_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "dual"},
    "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"},
    "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"}
    "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"}
  }

    profiles = jsondecode(file("${path.root}/profiles.json"))
    //profiles = jsondecode(file("/home/lhoang/apimodels/test/ns/constellation-network/profiles.json"))
    network_profiles = local.profiles != null ? merge(local.system_network_profiles, local.profiles.network_profiles) : local.system_network_profiles
    network_config_profiles = local.profiles != null ? merge(local.system_network_config_profiles, local.profiles.network_config_profiles) : local.system_network_config_profiles
    module_config_profiles = local.profiles != null ? merge(local.system_module_config_profiles, local.profiles.module_config_profiles) : local.system_module_config_profiles
}

output "profiles" {
  value = local.profiles
}

// type = map(object({network_config_profile = optional(string), hub_config_profile: optional(string), leaf_config_profile: optional(string)}))
output "network_profiles" {
  value = local.network_profiles
}

//type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
output "network_config_profiles" {
  value = local.network_config_profiles
}

//type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))
output "module_config_profiles" {
  value= local.module_config_profiles
}