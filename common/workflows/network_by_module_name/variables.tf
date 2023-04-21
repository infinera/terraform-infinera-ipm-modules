variable networks {
  type = list(object({name= optional(string), hub_name = optional(string), network_profile = optional(string), config=optional(object({name=optional(string),constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)})), hub_config = optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))}))
  description = "List of constellation Network"
}

variable leaf_modules {
  type = map(list(object({name: string, config_profile = optional(string), config: optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), tx_power_target_per_dsc: optional(number)}))})))
  description = "Leaf modules for specified network name "
}