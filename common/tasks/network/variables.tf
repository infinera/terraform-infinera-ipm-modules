variable "networks" {
  type = list(object({ name = optional(string), network_profile = optional(string), config = optional(object({ name = optional(string),
    constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), tc_mode = optional(string) })),
    hub_module = object({ name = optional(string), id = optional(string), serial_number = optional(string),
                          mac_address             = optional(string), host_port_name = optional(string),
                          host_name               = optional(string), host_chassis_id = optional(string),
                          host_chassis_id_subtype = optional(string), host_port_id = optional(string), host_port_id_subtype = optional(string),
                          host_sys_name           = optional(string), host_port_source_mac = optional(string),
                          config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string),
                           planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), fec_iterations : optional(string),
                            tx_clp_target : optional(string) })) }) 
  }))
  description = "List of constellation Network"
  default = [{ name = "XR Network1",
               network_profile = "network_profile1",
               hub_module      = { host_chassis_id = "00:00:00:00:00:01", host_chassis_id_subtype = "macAddress", host_port_id = "00:00:00:00:00:01",
                host_port_id_subtype = "macAddress", config = { traffic_mode = "VTIMode" } },
               leaf_modules = [{ host_chassis_id = "192.168.101.1", host_chassis_id_subtype = "ipAddress", host_port_id = "192.168.101.1",
                host_port_id_subtype = "ipAddress"}, { host_chassis_id = "cb3b.783c.38db", host_chassis_id_subtype = "chassisComponent", 
                host_port_id = "bc3b.783c.38bd", host_port_id_subtype = "chassisComponent", config = { traffic_mode : "VTIMode" } }] }]
  /*[{ name : "XR Network1", hub_name : "PORT_MODE_HUB", network_profile : "network_profile1",
               config = { modulation = "16QAM" },
               hub_module = { name : "PORT_MODE_HUB" } }]*/
}

variable "network_profiles" {
  type        = map(object({ network_config_profile = optional(string), hub_config_profile : optional(string), leaf_config_profile : optional(string) }))
  description = "Map of Network Profile"
}

variable "network_config_profiles" {
  type        = map(object({ constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), 
                             tc_mode = optional(string) }))
  description = "Map of Network Config profile"
}

variable "module_config_profiles" {
  type        = map(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string), 
                             planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), fec_iterations : optional(string),
                              tx_clp_target : optional(string) }))
  description = "Map of hub and leaf config profiles"
}

