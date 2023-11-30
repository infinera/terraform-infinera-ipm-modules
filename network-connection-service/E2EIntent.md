# E2E Network Connection Intent and Usages
The E2E Network Connection intent is the network template for the creation and management of the E2E workflow from XR Constellation Network to the Transport Capacity and then to the XR XR Network Connection. It uses the combination of system and user defined profiles of the three XR Constellation Network, Transport Capacity and XR Network Connection resources for the E2E configuration settings. This allows the network designer to define the common or custom network templates for uniformly creation and management of the e2E XR Network  at different site, region, country, etc. 

## E2E Network Connection Intent TF Variable
```
variable "transport_capacities" {
  type = list(object({ profile = optional(string),
    name      = optional(string), service_mode = optional(string), mc = optional(string),
    outer_vid = optional(string), implicit_transport_capacity = optional(string), labels = optional(map(string)),
    end_points = list(object({ identifier = object({ module_name = optional(string), 
                                                     module_id = optional(string), 
                                                     module_client_if_aid = optional(string),
                                                     serial_number = optional(string),
                                                     mac_address     = optional(string), 
                                                     host_port_name = optional(string), 
                                                     host_name = optional(string),
                                                     host_chassis_id = optional(string), 
                                                     host_chassis_id_subtype = optional(string),
                                                     host_port_id    = optional(string), 
                                                     host_port_id_subtype = optional(string),
                                                     host_sys_name   = optional(string), 
                                                     host_port_source_mac = optional(string)}),
                                 capacity = optional(number) }))
  }))
  description = "List of Network Connections"
}
variable "transport_capacities" {
  type = list(object({ profile = optional(string),
    name = string, capacity_mode = optional(string), labels = optional(map(string)),
    end_points = list(object({ identifier = object({ module_name = optional(string), 
                                                     module_id = optional(string), 
                                                     module_client_if_aid = optional(string),
                                                     serial_number = optional(string),
                                                     mac_address     = optional(string), 
                                                     host_port_name = optional(string), 
                                                     host_name = optional(string),
                                                     host_chassis_id = optional(string), 
                                                     host_chassis_id_subtype = optional(string),
                                                     host_port_id    = optional(string), 
                                                     host_port_id_subtype = optional(string),
                                                     host_sys_name   = optional(string), 
                                                     host_port_source_mac = optional(string)}),
                                 capacity = optional(number) }))
  }))
  description = "List of Transport Capacities"
}
variable "networks" {
  type = list(object({ profile = optional(string), // the profile name which will point to the three other profiles: Network, Hub and Leaf profile  
                       network_name = optional(string), 
                       constellation_frequency = optional(number), 
                       modulation = optional(string), 
                       managed_by = optional(string), 
                       tc_mode = optional(string),
                       topology = optional(string),
                       hub_module = object({ identifier = object({module_name = optional(string), 
                                                                  module_id = optional(string), 
                                                                  serial_number = optional(string), 
                                                                  mac_address = optional(string), 
                                                                  host_port_name = optional(string), 
                                                                  host_name = optional(string),
                                                                  host_chassis_id = optional(string), 
                                                                  host_chassis_id_subtype = optional(string),
                                                                  host_port_id = optional(string),
                                                                  host_port_id_subtype = optional(string),
                                                                  host_sys_name  = optional(string),
                                                                  host_port_source_mac = optional(string)}),
                                            traffic_mode : optional(string), 
                                            fiber_connection_mode : optional(string), 
                                            managed_by : optional(string), 
                                            planned_capacity : optional(string), 
                                            requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), 
                                            tx_clp_target : optional(string) })
                      leaf_modules = optional(list(object({ identifier = object({module_name = optional(string), 
                                                                                 module_id = optional(string), 
                                                                                 serial_number = optional(string), 
                                                                                 mac_address = optional(string), 
                                                                                 host_port_name = optional(string), 
                                                                                 host_name = optional(string),
                                                                                 host_chassis_id = optional(string), 
                                                                                 host_chassis_id_subtype = optional(string),
                                                                                 host_port_id = optional(string), 
                                                                                 host_port_id_subtype = optional(string),
                                                                                 host_sys_name  = optional(string), 
                                                                                 host_port_source_mac = optional(string)}),
                                                            profile  = optional(string),
                                                            traffic_mode = optional(string), 
                                                            fiber_connection_mode = optional(string),  
                                                            managed_by = optional(string), 
                                                            planned_capacity = optional(string),
                                                            requested_nominal_psd_offset = optional(string),
                                                            fec_iterations = optional(string),
                                                            tx_clp_target = optional(string) }))) 
  }))
  description = "List of constellation Network"
}
```
**Example**
```
networks = [{ network_name = "XR Network1",
              profile = "network_profile1",
              hub_module = { identifier = {module_name = "Test_HUB1"} },
              leaf_modules = [{identifier = { module_name = "Test_LEAF1" }},
                              {identifier = { module_name = "Test_LEAF2" }}] 
            }]

transport_capacities = [{ name = "tc1", profile = "system_tc_profile1",
  end_points = [{ identifier = { module_name = "Test_HUB1", module_client_if_aid = "XR-T1" }, capacity = 100 },
  { identifier = { module_name = "Test_LEAF1", module_client_if_aid = "XR-T1" }, capacity = 100 }]
  }, 
  { name = "tc2", profile = "system_tc_profile1",
  end_points = [{ identifier = { module_name = "Test_HUB1", module_client_if_aid = "XR-T2" }, capacity = 100 },
  { identifier = { module_name = "Test_LEAF2", module_client_if_aid = "XR-T1" }, capacity = 100 }]
  }
]
network_connections = [
  { name = "nc1", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T1", module_name = "Test_HUB1" }, capacity = 100 }, { identifier = { module_client_if_aid = "XR-T1", module_name = "Test_LEAF1" }, capacity = 100 }] }
]
```
## E2E Network Connection Intent Definition
Please see 
1. [XR Constellation Network Intent](../network-service/Intent.md)
2. [XR Transport Capacity](../transport-capacity-service/Intent.md)
3. [XR Connection Service](../network-connection-service/Intent.md)
