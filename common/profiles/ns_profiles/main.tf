terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
    # get json profile
    data = jsondecode(file("${path.module}/profiles.json"))

}
output "data" {
  value = local.data
}

// type = map(object({network_config_profile = optional(string), hub_config_profile: optional(string), leaf_config_profile: optional(string)}))
output "network_profiles" {
  value = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}, 
    "network_profile2" = { network_config_profile: "network_config_profile2", hub_config_profile: "hub_profile2", leaf_config_profile:"leaf_profile2"}
  }
  
}

//type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
output "network_config_profiles" {
  value = {
    "network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
    "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
  }
}

//type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))
output "module_config_profiles" {
  value= { 
    "hub_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "dual"},
    "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"},
    "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"}
    "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"}
  }
}