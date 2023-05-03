# Leaf Module
This module support CRUD operation for constellation network's leaf device. 

# Expected Intent
| Input Variable         | Type   | Description                                   |
| -----------------------| -------|-----------------------------------------------|
| network_id             | String | Id of the constellation network               |
| leaf_modules           | List   | list of modules to be add to network          |
| config_profile         | Object | Module config settings                        |

## Leaf Modules
<pre>
variable "leaf_modules" {
  type = list(object({ name = optional(string), id = optional(string), serial_number = optional(string),
                        mac_address     = optional(string), host_port_name = optional(string), host_name = optional(string),
                        host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                        host_port_id    = optional(string), host_port_id_subtype = optional(string),
                        host_sys_name   = optional(string), host_port_source_mac = optional(string),
                        config_profile  = optional(string),
                        config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), fec_iterations : optional(string), tx_clp_target : optional(string) })) }))
  description = "Leaf modules for specified network name "
  default     = [{ name = "PORT_MODE_LEAF1" }, { name = "PORT_MODE_LEAF2", config = { traffic_mode : "VTIMode" } }]
}
</pre>
 ## Leaf Module Intent Definition
| Attribute  | Type   | Description                                                                       |
|------------|--------|-----------------------------------------------------------------------------------|
| name       | string | Leaf module's name                                                       |
| config_profile | string | This specifies the module config profile which will override the network module config profile settings. Please see profiles section below for more details |
| config     | object | This config intent has the highest precedent. It will override both the module config_profile's settings and network module config profile settings |

## Leaf Module Config Intent Object (same as Hub)
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| name                    | string | Network Name        |           |                                               |
| fiber_connection_mode   | string | single, dual        | single    |                                               |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| planned_capacity        | string | 400G, 200G, 100G, 50G, 25G |    |                                               |
| requested_nominal_psd_offset | string | 0dB, +3dB, +6dB |          |                                               |
| fec_iterations          | string | undefined, standard, turbo |    |                                               |
| fec_iterations          | number | -3500 to 0          |           |                                               |

# Example 
