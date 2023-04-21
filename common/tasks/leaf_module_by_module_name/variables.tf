variable network_id {
  type = string
  default = "48b8610a-2a6b-491f-a71c-5fd12345be14"
}

variable network_config_profile {
  type = object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)})
  description = "Map of hub and leaf config profiles"
  default = {traffic_mode: "VTIMode",fiber_connection_mode: "dual"}
}

variable leaf_modules {
  type = list(object({name: string, config_profile = optional(string), config: optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))}))
  description = "Leaf modules for specified network name "
  default = [{name = "PORT_MODE_LEAF1", config = {traffic_mode: "VTIMode"}}, {name = "PORT_MODE_LEAF2"}]
  //default = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2"}]
}

variable module_config_profiles {
  type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))
  description = "Map of modules' config profiles"
}