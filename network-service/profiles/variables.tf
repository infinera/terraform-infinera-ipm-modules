// System profiles has three parts: Network Profile, Network Config Profile and Module Confif Profile
// Network- Profile : type = map(object({network_config_profile = optional(string), hub_config_profile= optional(string), leaf_config_profile= optional(string)}))
//Network Config Profile - type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
//Module-config profile: type = map(object({traffic_mode= optional(string),fiber_connection_mode= optional(string), managed_by= optional(string), planned_capacity= optional(string), requested_nominal_psd_offset= optional(string), fec_iterations= optional(string), tx_clp_target= optional(string)}))
variable "system_profile" {
  type = string
}

// Please see System Profile
variable "user_profile" {
  type = string
}
