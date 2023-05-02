variable networks {
  type = list(object({name= optional(string), 
                      network_profile = optional(string), 
                      config=optional(object({name=optional(string),constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)})), hub_config = optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)})), 
                      hub_module = object({ name = optional(string), id = optional(string), serial_number = optional(string), mac_address = optional(string), 
                                            host_port_name = optional(string),  host_name = optional(string), host_chassis_id = optional(string), 
                                            host_chassis_id_sub_type = optional(string), host_port_id = optional(string), host_port_id_sub_type = optional(string),
                                            host_sys_name = optional(string), host_port_source_mac = optional(string),
                                            config = optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))})
                      leaf_modules = optional(list(object({name = optional(string), id = optional(string), serial_number = optional(string), 
                                                           mac_address = optional(string), host_port_name = optional(string),  host_name = optional(string),
                                                           host_chassis_id = optional(string), host_chassis_id_sub_type = optional(string), 
                                                           host_port_id = optional(string), host_port_id_sub_type = optional(string), 
                                                           host_sys_name = optional(string), host_port_source_mac = optional(string), 
                                                          config_profile = optional(string), 
                                                          config = optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))})))}))
  description = "List of constellation Network"
  default = [{name= "XR Network1", 
             network_profile = "network_profile1", 
             config={modulation: "16QAM"}, 
             hub_module = { name = "PORT_MODE_HUB", config = {traffic_mode = "VTIMode"}}, 
             leaf_modules=[{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2",config={traffic_mode: "VTIMode"}}]}]
}