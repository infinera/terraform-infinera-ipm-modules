# Network Intent and Usages
The network intent is the network template for the creation and management of the constellation network. It uses system and user defined profiles for the network's configuration settings. This allows the network designer to define the common or custom network templates for uniformly creation and management of the constellation networks at different site, region, country, etc. For more information about profiles specification and usages, please refer to the [Profile Specification](https://github.com/infinera/terraform-ipm_modules/blob/master/network-service/Profiles.md)
*The Network Intent definition is fixed and any modification of its definitions may cause error in the execution.*
## Network Intent TF Variable
```
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
  default = [{ network_name = "XR Network1",
                  profile = "network_profile1", modulation : "16QAM" ,
                  hub_module      = { identifier= {module_name = "PORT_MODE_HUB"}, traffic_mode = "VTIMode" },
                  leaf_modules = [{ identifier= {module_name = "PORT_MODE_LEAF1" }}, { identifier= {module_name = "PORT_MODE_LEAF2"}, traffic_mode : "VTIMode" }] }]
}
```
## Network Intent Definition
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| profile                 | string | Network Profile     |           |  The network profile name.                                             |
| network_name            | string | Network Name        |           |                                               |
| traffic_mode            | string | L1Mode, VTIMode     | L1Mode    |                                               |
| constellation_frequency | number | 191000000 to 196100000 (MHz)    | 193000000 |                                   |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| tc_mode                 | bool   | true, false         |           |                                               |
| hub_module              | object | NA                  |           | Network's Hub Module                          |
| leaf_modules            | List   | NA                  |           | List of Leaf modules                          |

## Hub Module Intent

| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| identifier              | object |                 |           | Module Identifier     |
| managed_by              | string | cm, host        | cm        |                                               |
| fiber_connection_mode   | string | single, dual        | single    |                                               |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| planned_capacity        | string | 400G, 200G, 100G, 50G, 25G |    |                                               |
| requested_nominal_psd_offset | string | 0dB, +3dB, +6dB |          |                                               |
| fec_iterations          | string | undefined, standard, turbo |    |                                               |
| fec_iterations          | number | -3500 to 0          |           |                                               |


## Leaf Module Intent
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| identifier              | object |                     |           | Module Identifier          |
| profile                 | string |                     |           | configuration profile name for the leaf module |
| fiber_connection_mode   | string | single, dual        | single    |                                               |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| planned_capacity        | string | 400G, 200G, 100G, 50G, 25G |    |                                               |
| requested_nominal_psd_offset | string | 0dB, +3dB, +6dB |          |                                               |
| fec_iterations          | string | undefined, standard, turbo |    |                                               |
| fec_iterations          | number | -3500 to 0          |           |                                               |

## Module Identifier Object
The leaf or hub module is identified by one of 8 identifier groups below. Only one group is need to specified in the intent. I.E. if the group 1 identifier **name** is specified, only *name* is needed to specify the *module name selector* group

  1. Module_Name
  2. Module_id
  3. mac_address,
  4. serial_number
  5. host_name and  host_port_name
  6. host_chassis_id, host_chassis_subtype, host_port_id and host_id_subtype
  7. host_port_sys_name, host_port_id and host_id_subtype
  8. host_port_source_mac

| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| module_name **1**                | string |               |           | Use for module name selector     |
| module_id **2**                  | string |               |           | Module Id: Use for module id selector         |
| mac_address **3**         | string |               |           | Module MacAddress: Use for module MacAddress selector     |
| serial_number **4**       | string |               |           | Module Serial Number: Use for module serialNumber selector |
| host_name **5**           | string |               |           | Use for Host Name selector     |
| host_port_name **5**      | string |               |           | Use for Host Name selector         |
| host_chassis_id **6**     | string |               |           | Use for Host Port ID selector     |
| host_chassis_sub_type **6** | string |             |           | Use for Host Port ID selector     |
| host_port_id **6,7**      | string |               |           | Use for Host Port ID selector and Host SysName selector  |
| host_id_sub_type **6,7**  | string |               |           | Use for Host Port ID selector and Host SysName selector   |
| host_port_sys_name **7**  | string |               |           | Use for Host Port SourceMac selector     |
| host_port_source_mac**8** | string |               |           | Use for Host Port SourceMac selector     |