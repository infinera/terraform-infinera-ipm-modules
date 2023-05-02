variable "networks" {
  type = list(object({ name = optional(string),
                      network_profile = optional(string),
                      config = optional(object({ name = optional(string), constellation_frequency = optional(number), modulation = optional(string),
                                                managed_by = optional(string), tc_mode = optional(string) })),
                      hub_module = object({ identifier = object({host_chassis_id = string, host_chassis_id_subtype = string, host_port_id = string, 
                                                                 host_port_id_subtype = string}),
                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string),
                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) })
                      leaf_modules = optional(list(object({ identifier = object({host_chassis_id = string, host_chassis_id_subtype = string, host_port_id = string,
                                                                                host_port_id_subtype = string}),
                                                            config_profile  = optional(string),
                                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), 
                                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string),
                                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) }))) 
  }))
  description = "List of constellation Network"
  default = [{ name = "XR Network1",
               network_profile = "network_profile1",
               hub_module      = { identifier = {host_chassis_id = "00:00:00:00:00:01", host_chassis_id_subtype = "macAddress", host_port_id = "00:00:00:00:00:01",
                                   host_port_id_subtype = "macAddress"}, 
                                   config = { traffic_mode = "VTIMode" } },
              leaf_modules = [{ identifier = {host_chassis_id = "192.168.101.1", host_chassis_id_subtype = "networkAddress", host_port_id = "192.168.101.1", 
                                host_port_id_subtype = "networkAddress"}}, { identifier = {host_chassis_id = "cb3b.783c.38db",
                                host_chassis_id_subtype = "chassisComponent",
                                host_port_id = "bc3b.783c.38bd", host_port_id_subtype = "portComponent"}, config = { traffic_mode : "VTIMode" } }] 
             }]
}

variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type      = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}
