variable networks {
  type = list(object({name= optional(string), hub_name = optional(string), network_profile = optional(string), config=optional(object({name=optional(string),constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)})), hub_config = optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))}))
  description = "List of constellation Network"
  default = [{name: "XR Network1", hub_name : "PORT_MODE_HUB", network_profile : "network_profile1", config = {modulation = "16QAM"}, hub_config = {traffic_mode = "VTIMode"}}]
             //,{name= "XR Network2", hub_name = "VTI_MODE_HUB", network_profile = "network_profile2"}]
}

variable network_profiles {
  type = map(object({network_config_profile = optional(string), hub_config_profile: optional(string), leaf_config_profile: optional(string)}))
  description = "Map of Network Profile"
  default = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}, 
    "network_profile2" = { network_config_profile: "network_config_profile2", hub_config_profile: "hub_profile2", leaf_config_profile:"leaf_profile2"}
  }
}

variable network_config_profiles {
  type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
  description = "Map of Network Config profile"
  default = {
    "network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
  }
}

variable module_config_profiles {
  type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))
  description = "Map of hub and leaf config profiles"
  default = { 
    "hub_profile1" = {traffic_mode: "VTIMode",fiber_connection_mode: "dual"},
    "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"},
    "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"}
    "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single"}
  }
}

