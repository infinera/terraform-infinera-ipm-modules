# Network Intent
The network intent specifies the creation and management of the constellation network, its hub and leaf modules. The profiles define the configuration templates for the network and its modules. The network Designer will define the common network profiles (templates) and use them in the intents to uniformly create and manage constellation networks at a site, region, country, etc. 

# Network Intent
The network intent specifies a list of desired constellation networks. In addition the network intent uses system and user profiles for the network's configuration. This allows the network designer to define a network tepmplate with pre-defined configuration profiles such as Point to Point, Point to Multi-point network in different service rates, etc. For more information about profiles specification, please refer to the [Profile Specification]()
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
| network_name                    | string | Network Name        |           |                                               |
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


# Constellation Network Profiles 
The network profiles (AKA templates) are the common system and/or user defined settings for network and module configurations. 
Usually the network designer shall define the common network profiles for network and/or its modules: **Network Profile**, **Network Configuration Profile**, and **Module Configuration Profile**. Using these profiles in the network intents shall allow the creation of networks with the same characteristics within or across sites, regions or domain networks. In addition, the user can override the profile settings in the intent as desired.

```
Network Profile --------|------------> Network's config profile ------> configuration settings for Network
                        |
                        |------------> Hub module's config profile ------> Hub's configuration settings
                        |
                        |------------> Leaf modules' config profile ------> Leaf modules' config settings

network_profiles = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}, 
    "network_profile2" = { network_config_profile: "network_config_profile2", hub_config_profile: "hub_profile2", leaf_config_profile:"leaf_profile2"}
}

network_config_profiles =  {"network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
                             "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
  }

module_config_profiles = { 
      "hub_profile1" = {traffic_mode: "VTIMode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.3},
      "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3},
      "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
      "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
    }
```

## Network Profile Definition
| Attribute               | Type     | Description                 |
|-------------------------|--------  |-----------------------------|
| network_config_profile  | string   | name of the Network Configuration Profile |
| hub_config_profile      | string   | name of the Module Configuration Profile for Hub Module |
| leaf_config_profile     | string   | name of the Module Configuration Profile for all leaf modules|

### Network Profile TF Variable
```
 variable network_profiles {
  type = map(object({network_config_profile = optional(string), 
                     hub_config_profile: optional(string), 
                     leaf_config_profile: optional(string)}))
  description = "Map of Network Profile"
  }
```
### Network Profile Example
```
network_profiles = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}, 
    "network_profile2" = { network_config_profile: "network_config_profile2", hub_config_profile: "hub_profile2", leaf_config_profile:"leaf_profile2"}
}
```

## Network configuration profiles
The Network Configuration Profile specifies the common configurations for a constellation network. 
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| name                    | string | Network Name        |           |                                               |
| traffic_mode            | string | L1Mode, VTIMode     | L1Mode    |                                               |
| constellation_frequency | number | 191000000 to 196100000 (MHz) | 193000000 |                                      |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| tc_mode                 | bool   | true, false         |           |                                               |
| topology              | string |             | cm        |                                               |

### Network Configuration Profile TF Variable
```
variable network_config_profiles {
    type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), 
                       tc_mode=optional(string), topology=optional(string)}))
    description = "Map of Network Config profile"
}
```
### Network ConfigurationProfile Example
```
network_config_profiles =  {"network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
                             "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
  }
```
## Module Configuration Profile 
The Module Configuration Profile specifies the common configurations for a Hub/Leaf Module.
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| fiber_connection_mode   | string | single, dual        | single    |                                               |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| planned_capacity        | string | 400G, 200G, 100G, 50G, 25G |    |                                               |
| requested_nominal_psd_offset | string | 0dB, +3dB, +6dB |          |                                               |
| fec_iterations          | string | undefined, standard, turbo |    |                                               |
| fec_iterations          | number | -3500 to 0          |           |                                               |

### Network Configuration Profile TF Variable
```
  variable module_config_profiles {
    type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))
    description = "Map of hub and leaf config profiles"
  }
```
### Module Configuration Profile Example
```
  module_config_profiles = { 
      "hub_profile1" = {traffic_mode: "VTIMode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.3},
      "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3},
      "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
      "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
    }
```
# How to Override the Profile Settings

## How to Override The Network Configuration Profile Settings
### __Steps__
1. To override the network configuration profile setting, the user can specify the inline configuration in the network intent as shown in the example below
    <pre>
    // "XR Network1" network shall have constellation_frequency set to 194000001 regardless of setting in the network config profile "network_profile1"
    // "XR Network2" network's configuration shall be configured using the specification from network config profile "network_profile2"
    networks = [{network_name= "XR Network1", 
                  network_profile = "network_profile1", 
                  <b>constellation_frequency=194000001</b>   // This constellation_frequency settings shall override the settings in network_profile 
                  hub_module = { identifier = {module_name = "PORT_MODE_HUB"}}, 
                  leaf_modules=[{identifier =  {module_name = "PORT_MODE_LEAF1"}}]}]`
    </pre>

2. Execute Terraform apply
   
## How to Override The Module Configuration Profile settings

### __Steps__
1. To override the Module configuration profile setting, the user can specify the inline configuration in the hub/leaf module intent as shown in the example below
   1. __Hub Module__
      For hub module, specify the inline configuration settings in the network's hub intent data as shown in the example below
      <pre>
      // The network's hub module shall have <b>traffic_mode set to "L1Mode"</b> overriding the hub config setting specified in network_profile
      networks = [{network_name= "XR Network1", 
                    network_profile = "network_profile1", 
                    hub_module = { identifier = {module_name = "PORT_MODE_HUB"}, <b>traffic_mode = "L1Mode"</b>}, 
                    leaf_modules=[{identifier =  {module_name = "PORT_MODE_LEAF1"}}]}]
      </pre>
   2. __Leaf Module__
      For leaf module, specify inline configuration settings in the leaf_modules intent data as shown in the example below
      <pre>
      // Leaf module "PORT_MODE_LEAF1" shall be configured using the configuration specification from config profile "leaf_config_profile2"
      // Leaf module "PORT_MODE_LEAF2" shall have traffic_mode set to "L1Mode" regardless of the setting in its config profile settings
      networks = [{network_name= "XR Network1", 
                      network_profile = "network_profile1", 
                      hub_module = { identifier = {module_name = "PORT_MODE_HUB"}}, 
                      leaf_modules=[{identifier =  {module_name = "PORT_MODE_LEAF1"}, profile = "leaf_config_profile2"},
                                    {identifier =  {module_name = "PORT_MODE_LEAF2"}, <b>traffic_mode = "L1Mode"}</b>]}]
      </pre>
2. Execute Terraform apply
