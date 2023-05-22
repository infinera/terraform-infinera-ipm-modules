/* variable "networks" {
  type = list(object({ profile = optional(string),
                       name = optional(string), constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), tc_mode = optional(string) ,
                       hub_module = object({ identifier = object({name = optional(string), id = optional(string), serial_number = optional(string), 
                                                                 mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                            traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string), 
                                            planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), tx_clp_target : optional(string) })
                      leaf_modules = optional(list(object({ identifier = object({name = optional(string), id = optional(string), 
                                                            serial_number = optional(string), mac_address = optional(string), 
                                                            host_port_name = optional(string), host_name = optional(string),
                                                            host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                            host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                            host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                                            profile  = optional(string),
                                                            traffic_mode = optional(string), fiber_connection_mode = optional(string),  
                                                            managed_by = optional(string), planned_capacity = optional(string),
                                                            requested_nominal_psd_offset = optional(string),fec_iterations = optional(string),
                                                            tx_clp_target = optional(string) }))) 
  }))
  description = "List of constellation Network"
  default = [{ name = "XR Network1",
                  profile = "network_profile1", modulation : "16QAM" ,
                  hub_module      = { identifier= {name = "PORT_MODE_HUB"}, traffic_mode = "VTIMode" },
                  leaf_modules = [{ identifier= {name = "PORT_MODE_LEAF1" }}, { identifier= {name = "PORT_MODE_LEAF2"}, traffic_mode : "VTIMode" }] }]
} */

networks = [{ name = "XR Network1",
               profile = "network_profile1",
               hub_module      = { identifier = {host_chassis_id = "00:00:00:00:00:01", host_chassis_id_subtype = "macAddress", 
                                                 host_port_id = "00:00:00:00:00:01", host_port_id_subtype = "macAddress"}, 
                                   traffic_mode = "VTIMode"  },
              leaf_modules = [{ identifier = {host_chassis_id = "192.168.101.1", host_chassis_id_subtype = "networkAddress", host_port_id = "192.168.101.1", 
                                host_port_id_subtype = "networkAddress"}}, { identifier = {host_chassis_id = "cb3b.783c.38db",
                                host_chassis_id_subtype = "chassisComponent",
                                host_port_id = "bc3b.783c.38bd", host_port_id_subtype = "portComponent"}, traffic_mode : "VTIMode" }] 
             }]
