variable "networks" {
  type = list(object({ profile = optional(string),
                       network_name = optional(string), constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), tc_mode = optional(string), topology = optional(string),
                       hub_module = object({ identifier = object({module_name = optional(string), module_id = optional(string), serial_number = optional(string), 
                                                                 mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                            traffic_mode = optional(string), fiber_connection_mode = optional(string), managed_by = optional(string), 
                                            planned_capacity = optional(string), requested_nominal_psd_offset = optional(string), 
                                            fec_iterations = optional(string), tx_clp_target = optional(string) })
  }))
  description = "List of constellation Network"
  /*default = [{ name = "XR Network1",
                profile = "network_profile1",
                hub_module      = { identifier = {host_chassis_id = "00:00:00:00:00:01", host_chassis_id_subtype = "macAddress", host_port_id = "00:00:00:00:00:01", host_port_id_subtype = "macAddress"}, config = { traffic_mode = "VTIMode" } },
             }]*/
}

variable "network_profiles" {
  type        = map(object({ network_config_profile = optional(string), hub_config_profile = optional(string), leaf_config_profile = optional(string) }))
  description = "Map of Network Profile"
}

variable "network_config_profiles" {
  type        = map(object({ constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), 
                             tc_mode = optional(string), topology = optional(string) }))
  description = "Map of Network Config profile"
}

variable "module_config_profiles" {
  type        = map(object({ traffic_mode = optional(string), fiber_connection_mode = optional(string), managed_by = optional(string), 
                             planned_capacity = optional(string), requested_nominal_psd_offset = optional(string), fec_iterations = optional(string),
                              tx_clp_target = optional(string) }))
  description = "Map of hub and leaf config profiles"
}

