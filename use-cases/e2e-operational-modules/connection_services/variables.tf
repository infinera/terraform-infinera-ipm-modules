variable "networks" {
  type = list(object({ profile = optional(string),
    network_name = optional(string), constellation_frequency = optional(number), modulation = optional(string), managed_by = optional(string), tc_mode = optional(string), topology = optional(string),
    hub_module = object({ identifier = object({ module_name = optional(string), module_id = optional(string), serial_number = optional(string),
      mac_address     = optional(string), host_port_name = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name = optional(string), host_port_source_mac = optional(string) }),
      traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string),
      planned_capacity : optional(string), requested_nominal_psd_offset : optional(string),
    fec_iterations : optional(string), tx_clp_target : optional(string) })
    leaf_modules = optional(list(object({ identifier = object({ module_name = optional(string), module_id = optional(string),
      serial_number   = optional(string), mac_address = optional(string),
      host_port_name  = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name = optional(string), host_port_source_mac = optional(string) }),
      profile                      = optional(string),
      traffic_mode                 = optional(string), fiber_connection_mode = optional(string),
      managed_by                   = optional(string), planned_capacity = optional(string),
      requested_nominal_psd_offset = optional(string), fec_iterations = optional(string),
    tx_clp_target = optional(string) })))
  }))
  description = "List of constellation Network"
  default = [{ network_name = "XR Network1",
              profile = "network_profile1",
              hub_module = { identifier = {module_name = "XR-HUB1-4-100"} },
              leaf_modules = [{identifier = { module_name = "XR-LEAF1-4-100" }},
                              {identifier = { module_name = "XR-LEAF2-4-100" }}] 
            }]
}


variable "transport_capacities" {
  type = list(object({ profile = optional(string),
    name = string, capacity_mode = optional(string), labels = optional(map(string)),
    end_points = list(object({ identifier = object({ module_name = optional(string), module_id = optional(string), serial_number = optional(string),
      mac_address     = optional(string), host_port_name = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name   = optional(string), host_port_source_mac = optional(string),
      module_client_if_aid = optional(string) }),
    capacity = optional(number) }))
  }))
  description = "List of Transport Capacities"
  default = [{ name = "tc1", profile = "system_tc_profile1",
                end_points = [{ identifier = { module_name = "XR-HUB1-4-100", module_client_if_aid = "XR-T1" }, capacity = 100 },
                { identifier = { module_name = "XR-LEAF1-4-100", module_client_if_aid = "XR-T1" }, capacity = 100 }]
                }, 
                { name = "tc2", profile = "system_tc_profile1",
                end_points = [{ identifier = { module_name = "XR-HUB1-4-100", module_client_if_aid = "XR-T2" }, capacity = 100 },
                { identifier = { module_name = "XR-LEAF2-4-100", module_client_if_aid = "XR-T1" }, capacity = 100 }]
                }
              ]
}

variable "network_connections" {
  type = list(object({ profile = optional(string),
    name      = optional(string), service_mode = optional(string), mc = optional(string),
    outer_vid = optional(string), implicit_transport_capacity = optional(string), labels = optional(map(string)),
    end_points = list(object({ identifier = object({ module_name = optional(string), module_id = optional(string), serial_number = optional(string), module_client_if_aid = optional(string),
      mac_address     = optional(string), host_port_name = optional(string), host_name = optional(string),
      host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
      host_port_id    = optional(string), host_port_id_subtype = optional(string),
      host_sys_name = optional(string), host_port_source_mac = optional(string) }),
    capacity = optional(number) }))
  }))
  description = "List of Network Connection"
  default = [
              { name = "nc1", profile = "nc_profile1",
                end_points = [{ identifier = { module_client_if_aid = "XR-T1", module_name = "XR-HUB1-4-100" }, capacity = 100 }, 
                              { identifier = { module_client_if_aid = "XR-T1", module_name = "XR-LEAF1-4-100" }, capacity = 100 }] },
              { name = "nc2", profile = "nc_profile1",
                end_points = [{ identifier = { module_client_if_aid = "XR-T2", module_name = "XR-HUB1-4-100" }, capacity = 100 }, 
                              { identifier = { module_client_if_aid = "XR-T1", module_name = "XR-LEAF2-4-100" }, capacity = 100 }] }
            ]
}

variable "ipm_user" {
  type = string
  default = "infinera"
}

variable "ipm_password" {
  type      = string
  sensitive = true
  default = "infinera"
}

variable "ipm_host" {
  type = string
  default = "ipm-5"
}

variable "system_profile" {
  type = string
  default = "network_profiles.json,tc_profiles.json,nc_profiles.json" 
}

variable "user_profile" {
  type = string
  default = ""
}
