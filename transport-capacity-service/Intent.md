# Transport Capacity Intent and Usages
The Transport Capacity intent is the network template for the creation and management of the Transport Capacity. It uses system and user defined profiles for the Transport Capacity's configuration settings. This allows the network designer to define the common or custom network templates for uniformly creation and management of the Transport Capacities at different site, region, country, etc. For more information about Transport Capacity profiles specification and usages, please refer to the [Profile Specification](https://bitbucket.infinera.com/projects/MAR/repos/terraform-ipm-modules/browse/transport-capacity-service/Profiles.md)
## Transport Capacity Intent TF Variable
```
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
  default = [{ name = "tc1", profile = "system_tc_profile1",
    end_points = [{ identifier = { host_chassis_id = "192.168.101.1", host_chassis_id_subtype = "ipAddress", host_port_id = "192.168.101.1",
      host_port_id_subtype = "ipAddress" } }, { identifier = { host_chassis_id = "cb3b.783c.38db", host_chassis_id_subtype = "chassisComponent",
    host_port_id = "bc3b.783c.38bd", host_port_id_subtype = "chassisComponent" }, capacity = 400 }]
  }]
}
```
## Transport Capacity Intent Definition
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| profile                 | string | Network Profile     |           |  The network profile name.                    |
| name            | string | Network Name        |           |                                               |
| capacity_mode            | string |      |     |                                               |
| labels | Map(string) |     |  |                                   |
| endpoints              | array |   |           |  Endpoints                                             |

## Endpoint object

| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| identifier              | object |                 |           | Module Identifier     |
| capacity              | int64 |         |         |                                               |

## Endpoint Identifier Object
The endpoint is identified by one of 8 identifier selector groups below and only one group is need to specified in the intent. 
  1. module_name, module_client_if_aid (*moduleIfSelectorByModuleName*)
  2. module_id, module_client_if_aid (*moduleIfSelectorByModuleId*)
  3. Mac_address, module_client_if_aid (*moduleIfSelectorByModuleMAC*)
  4. Serial_number, module_client_if_aid (*moduleIfSelectorByModuleSerialNumber*)
  5. Host_name and  host_port_name (*hostPortSelectorByName*)
  6. Host_chassis_id, host_chassis_subtype, host_port_id and host_id_subtype (*hostPortSelectorByPortId*)
  7. Host_port_sys_name, host_port_id and host_id_subtype (*hostPortSelectorBySysName*)
  8. Host_port_source_mac (*hostPortSelectorByPortSourceMAC*)

| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| module_name                 | string |               |           |     |
| module_id                   | string |               |           | |
| module_client_if_aid     | string |   |   |    |
| mac_address          | string |               |           |   |
| serial_number        | string |               |           |  |
| host_name            | string |               |           |    |
| host_port_name       | string |               |           |  |
| host_chassis_id *     | string |               |           |  |
| host_chassis_sub_type  | string |             |           |  |
| host_port_id       | string |               |           |  |
| host_id_sub_type   | string |               |           |   |
| host_port_sys_name  | string |               |           |    |
| host_port_source_mac| string |               |           |   |