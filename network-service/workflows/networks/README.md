# Constellation Network 
The user can create one or more constellation networks by specify the desired intent for the networks and their leaf modules.

# Prerequisite
1. The "infinera/ipm" provider
    a. Build it. Please down load and build the provider https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse
    b. Available in accessible repository. 
2. Terraform (Install terraform via https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. IPM server credentials: Define the following environment variables: TF_VAR_ipm_user, TF_VAR_ipm_password, and TF_VAR_ipm_host. 
4. The user defined profiles.json is available in the TF root directory (where the command "terraform apply" is executed)

# Create and Update Constellation Network From the Intent 
## Example of The Creating Network no leaf modules
```
XR Network1  (hub=PORT_MODE_HUB)
```
Create a new directory for network service terraform test. This directory contains two terraform files: main.tf, variables.tf and the intent network.tfvars.
## The intent - network.tfvars
Please see sample intent files in <b>bitbucket.infinera.com:7999/mar/terraform-ipm-modules.git//use-cases/ns/input-data</b> directory
```
networks = [{name= "XR Network1", 
             network_profile = "network_profile1", 
             config={modulation: "16QAM"}, 
             hub_module = { identifier = {name = "PORT_MODE_HUB"}, config = {traffic_mode = "L1Mode"}}}]
```
## The TF files
### main.tf
```
terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~> 0.4.0"
    }
  }
}

provider "ipm" {
  username = var.ipm_user     // TF_VAR_ipm_user
  password = var.ipm_password // TF_VAR_ipm_password
  host     = var.ipm_host     // TF_VAR_ipm_host
}

module "network" {
  source                   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//common/workflows/network"
  <b>networks</b>                 = var.networks 
}
```

### variables.tf
```
variable "networks" {
  type = list(object({ name = optional(string),
                      network_profile = optional(string),
                      config = optional(object({ name = optional(string), constellation_frequency = optional(number), modulation = optional(string),
                                                managed_by = optional(string), tc_mode = optional(string) })),
                      hub_module = object({ identifier = object({name = optional(string), id = optional(string), serial_number = optional(string), 
                                                                 mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string),
                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) })
                      leaf_modules = optional(list(object({ identifier = object({name = optional(string), id = optional(string), serial_number = optional(string), 
                                                                mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                                            config_profile  = optional(string),
                                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), 
                                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string),
                                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) }))) 
  }))
  description = "List of constellation Network"
}

variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}
```

## Steps
Go to the main.tf file's directory and execute the following commands
1. terraform init
2. terraform apply -var-file=xxx/network.tfvars
   The network "XR Network1" with hub "PORT_MODE_HUB" shall be created.

## Add New Leaf Modules to the just Created XR Network
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1

```
In the same directory, follow these steps
1. Update the intent file **network.tfvars** to add new leaf modules
```
 networks = [{name= "XR Network1", 
             network_profile = "network_profile1", 
             hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
             leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
```
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   Three leaf modules are added to the network "XR Network1".

## Add Two Additional Leaf Modules to the XR Network "XR Network1"
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1
                                             |
                                             |-----> leaf2 = PORT_MODE_LEAF2
                                             |
                                             |-----> leaf3 = PORT_MODE_LEAF1
```
In the same directory, follow these steps
1. Update the intent file **network.tfvars** to add new leaf module
```
  networks = [{name= "XR Network1", 
             network_profile = "network_profile1",  
             hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
             leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}},
                            {identifier =  {name = "PORT_MODE_LEAF2"}},
                            {identifier = {name = "PORT_MODE_LEAF3"}}]}]
```
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   Leaf module "PORT_MODE_LEAF3" is added to the network "XR Network1".

## Remove Leaf Modules From The Created XR Network
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1
```
In the same directory, follow these steps
1. Update the intent file **network.tfvars** to remove two leaf modules ""PORT_MODE_LEAF2" and "PORT_MODE_LEAF3".
```
  networks =  [{name= "XR Network1", 
                network_profile = "network_profile1", 
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
```
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   Both Leaf module2 "PORT_MODE_LEAF2" and "PORT_MODE_LEAF3" are deleted from the network "XR Network1".

**In the network configuration Intent, its hub and leaf configuration are specified by the **network profile"** settings. The **network profile** settings shall include the profile specifications for the network configurations, its hub module configurations and its leafs' modules configurations. All these configuration profile's settings can be overridden by specifying their specific configuration settings in the intent. Please see the **Profiles** section for more information how to override these configuration profiles.**

## Update The Configuration Settings For the XR Network and all its Modules
In the same directory, follow these steps
1. Update the intent file **"network.tfvars"** to change the network profile to new profile.
  <pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
  </pre>
2. Execute commands **terraform apply -var-file=network.tfvars**. 
   This actions will update the network and its modules configurations based on the setting specifications in the new <b>network profile "network_profile2"</b>

## Update The Configuration Settings for the XR Network Only
In the same directory, follow these steps
1. Update the intent file **network.tfvars** to change the network's configuration only.
  <pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
               <b>config={name="aaa"",constellation_frequency= 193000, modulation = "16QAM", managed_by="cm", tc_mode=true}</b>,
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
  </pre>
2. execute commands **terraform apply -var-file=network.tfvars** 
   The network "Network1" configuration shall be updated using the **config** specifications.

## Update The Configuration Settings for the Hub Module of an XR Network
In the same directory, follow these steps
1. Update the intent file **network.tfvars** to override the configuration of the Hub module.
  <pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
                hub_module = { identifier = {name = "PORT_MODE_HUB"},
                               <b>config={traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G",
                                requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500}</b>}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
  </pre>
2. execute commands **terraform apply -var-file=network.tfvars** 
   The hub module's configuration of the network "Network1" shall be updated using the **hub_config** specifications.

## Update The Configuration Settings for the Leaf Modules of an XR Network
In the same directory, follow these steps
1.  Update the intent file **network.tfvars** to override the configuration of the leaf modules of a constellation network
  <pre>
  networks = [{name= "XR Network1", 
                network_profile = "network_profile2", 
                hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}, <b>
                               config_profile = "leaf_profile2"</b>},
                               {identifier =  {name = "PORT_MODE_LEAF2"}, 
                               <b>config={traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G",
                                requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500}</b>}]}]
  </pre>
2. execute commands **terraform apply -var-file=network.tfvars** 
   . The leaf module "PORT_MODE_LEAF1" configuration shall be updated using the **config_profile** specifications.
   . The leaf module "PORT_MODE_LEAF2" configuration shall be updated using the **config** specifications.

# Constellation Network Intent
To create the network the user must specify an intent with the network intent and/or its leaf module intent. The network intent shall include its Hub intent.
Ideally the user shall specify the network and its module intent only. The profiles are defined for common deployment configuration and they will be reused across many network creation and modification.

## The Network Intent
The network intent is a array of network specification as shown below. 
```
variable "networks" {
  type = list(object({ name = optional(string),
                      network_profile = optional(string),
                      config = optional(object({ name = optional(string), constellation_frequency = optional(number), modulation = optional(string),
                                                managed_by = optional(string), tc_mode = optional(string) })),
                      hub_module = object({ identifier = object({name = optional(string), id = optional(string), serial_number = optional(string), 
                                                                 mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string),
                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) })
                      leaf_modules = optional(list(object({ identifier = object({name = optional(string), id = optional(string), serial_number = optional(string), 
                                                                mac_address = optional(string), host_port_name = optional(string), host_name = optional(string),
                                                                host_chassis_id = optional(string), host_chassis_id_subtype = optional(string),
                                                                host_port_id = optional(string), host_port_id_subtype = optional(string),
                                                                host_sys_name  = optional(string), host_port_source_mac = optional(string)}),
                                                            config_profile  = optional(string),
                                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), 
                                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string),
                                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) }))) 
  }))
  description = "List of constellation Network"
  default = [{name= "XR Network1", 
             network_profile = "network_profile1", 
             config={modulation: "16QAM"}, 
             hub_module = { identifier = {name = "PORT_MODE_HUB"}, config = {traffic_mode = "L1Mode"}}, 
             leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}, 
                           {identifier =  {name = "PORT_MODE_LEAF2"},config={traffic_mode: "L1Mode"}}]}]
}
```

## Network Intent Definition
| Attribute              | Type   | Description                                        |
|------------------------|--------|----------------------------------------------------|
| name                   | string | Constellation Network Name                         |
| network_profile        | string | Name of the profile for this Network.  Please see profiles section below for more details |
| config                 | object | This will override the network profile settings    |
| hub_module             | object | Hub Module                                         |
| leaf_modules           | List   | List of Leaf modules                               |

## Network Config Intent Object
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| name                    | string | Network Name        |           |                                               |
| traffic_mode            | string | L1Mode, VTIMode     | L1Mode    |                                               |
| constellation_frequency | number | 191000000 to 196100000 (MHz)    | 193000000 |                                   |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| tc_mode                 | bool   | true, false         |           |                                               |

## Hub Module Object

| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| identifier              | object |                 |           | Use to identify the hub module     |
| config                  | object |                 |           |                                    |
| managed_by              | string | cm, host        | cm        |                                               |

## Module Identifier Object
The leaf or hub module is identified by one of 8 identifier groups below. Only one group is need to specified in the intent. I.E. if the group 1 identifier **name** is specified, there is no need to specifyy other group identi

  1. Name
  2. id
  3. mac_address,
  4. serial_number
  5. host_name and  host_port_name
  6. host_chassis_id, host_chassis_subtype, host_port_id and host_id_subtype
  7. host_port_sys_name, host_port_id and host_id_subtype
  8. host_port_source_mac

| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| name **1**                | string |               |           | Use for module name selector     |
| id **2**                  | string |               |           | Module Id: Use for module id selector         |
| mac_address **3**         | string |                     |           | Module MacAddress: Use for module MacAddress selector     |
| serial_number **4**       | string |                     |           | Module Serial Number: Use for module serialNumber selector |
| host_name **5**           | string |                     |           | Use for Host Name selector     |
| host_port_name **5**      | string |                     |           | Use for Host Name selector         |
| host_chassis_id **6**     | string |                     |           | Use for Host Port ID selector     |
| host_chassis_sub_type **6** | string |                    |           | Use for Host Port ID selector     |
| host_port_id **6,7**      | string |                     |           | Use for Host Port ID selector and Host SysName selector  |
| host_id_sub_type **6,7**  | string |                     |           |Use for Host Port ID selector and Host SysName selector   |
| host_port_sys_name **7**  | string |                     |           | Use for Host Port SourceMac selector     |
| host_port_source_mac**8** | string |                     |           | Use for Host Port SourceMac selector     |

## Hub Module Config Object
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

## Leaf Module Intent Definition
| Attribute  | Type   | Description                                                                       |
|------------|--------|-----------------------------------------------------------------------------------|
| identifier     | object |    Use to identify the leaf module. Please see the  Module Identifier Object definition above     |
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


# Constellation Network Profiles 
The profiles are the common system and/or user defined settings for network and module configurations. There are two supported profiles: **Network Configuration Profile** and **Module Configuration Profile**. These profiles are available to be used in the constellation network intents to allow the user creating network with the same configuration without repeating the same configuration settings in the intent. In addition, the user can override the profile settings in the intent as desired.
The profiles are supported for Constellation Network are: Network Profile, Network configuration profile, and Module configuration profile.
```
Network Profile --------|------------> Network's config profile ------> Network's configuration settings
                        |
                        |------------> Hub module's config profile ------> Hub's configuration settings
                        |
                        |------------> Leaf modules' config profile ------> Leaf modules' config settings
```

The example intents above are referring to the network profile, network config profiles and module config profile for hub and leaf modules. They are system or user defined profiles and are available in the IPM network service modules. Examples of these profiles are shown below.
```
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

## Network Configuration Profile
The user shall be able to create and update the constellation network and its hub/leaf modules using one of the system or user defined Network Configuration Profiles. This shall specify the configured profiles for the network, its hub and leaf modules. 
```
  network_profiles = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}
  }
  variable network_profiles {
  type = map(object({network_config_profile = optional(string), 
                     hub_config_profile: optional(string), 
                     leaf_config_profile: optional(string)}))
  description = "Map of Network Profile"
  default = {
    "network_profile1" = { network_config_profile: "network_config_profile1", hub_config_profile: "hub_profile1", leaf_config_profile:"leaf_profile1"}, 
    "network_profile2" = { network_config_profile: "network_config_profile2", hub_config_profile: "hub_profile2", leaf_config_profile:"leaf_profile2"}
    }
  }
```
  The support attributes are shown in table below
  | Attribute                  | Type   | Description                                            |
  |----------------------------|--------|--------------------------------------------------------|
  | network_config_profile | string | Specify the configuration settings for the network     |
  | hub_config_profile     | string | Specify the configuration settings for the hub module  |
  | leaf_config_profile    | string | Specify the configuration settings for the Leaf module |

## Network configuration profiles
The Network Configuration Profile specifies the common configurations for a constellation network. 

```
  network_config_profiles =  {"network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
                             "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
  }
  variable network_config_profiles {
    type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), 
                       tc_mode=optional(string)}))
    description = "Map of Network Config profile"
    default =  {"network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
                "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}}
  }
```
### Network Configuration Profile Object
  The supported network configuration attributes are listed below.
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| name                    | string | Network Name        |           |                                               |
| traffic_mode            | string | L1Mode, VTIMode     | L1Mode    |                                               |
| constellation_frequency | number | 191000000 to 196100000 (MHz) | 193000000 |                                      |
| modulation              | string | 16QAM, QPSK, 8QAM   |           |                                               |
| managed_by              | string | cm, host            | cm        |                                               |
| tc_mode                 | bool   | true, false         |           |                                               |

   
### How to Override The network Configuration Profile Settings
To override the network configuration profile setting, the user can specify the network configuration **"config"** in the network intent as shown below for "XR Network1"
   
   <pre>
    // "XR Network1" network shall have constellation_frequency set to 194000001 regardless of setting in the network config profile "network_profile1"
    // "XR Network2" network's configuration shall be configured using the specification from network config profile "network_profile2"
    networks = [{name= "XR Network1", 
                 network_profile = "network_profile1", 
                 <b>config ={constellation_frequency=194000001}</b>
                 hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                 leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]},
                 {name= "XR Network2", 
                 <b>network_profile = "network_profile2"</b>, 
                 hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                 leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
   </pre>

## Module Configuration Profile 
The Module Configuration Profile specifies the common configurations for a Hub/Leaf Module.
```
  module_config_profiles = { 
      "hub_profile1" = {traffic_mode: "VTIMode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.3},
      "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3},
      "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
      "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
    }

  variable module_config_profiles {
    type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))
    description = "Map of hub and leaf config profiles"
    default = { 
      "hub_profile1" = {traffic_mode: "VTIMode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.3},
      "hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3},
      "leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
      "leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
    }
  }
```
### Module Configuration Profile Object 
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

### How to Override the Module Configuration Profile settings
To override the Module configuration profile setting, the user can 
1. For hub module, specify the Module configuration "config" in the networks intent data as shown below for "XR Network1"
   <pre>
    // "XR Network1" network's hub module shall have constellation_frequency set to 194000001 regardless of the setting in the hub network config profile ""hub_profile1"
    networks = [{name= "XR Network1", 
                 network_profile = "network_profile1", 
                 <b>config ={constellation_frequency=194000001}</b>
                 hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                 leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}}]}]
   </pre>
2. For leaf module, specify the Module configuration profile "config" and/or "config_profile" in the leaf_modules intent data as shown below for "XR Network1"
  <pre>
  // Leaf module "PORT_MODE_LEAF1" shall be configured using the configuration specification from config profile "leaf_config_profile2"
  // Leaf module "PORT_MODE_LEAF2" shall have traffic_mode set to "L1Mode" regardless of the setting in its config profile settings
  networks = [{name= "XR Network1", 
                 network_profile = "network_profile1", 
                 hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
                 leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}, config_profile = "leaf_config_profile2"},
                               {identifier =  {name = "PORT_MODE_LEAF2"}, <b>config = {traffic_mode = "L1Mode"}}</b>]}]
  </pre>

## How to Define and Use the User Define Profiles
The Constellation Network's profiles are system defined profiles which can be extending by the additional user defined profiles. The following steps are required to customize the network profiles.
### Define the user defined profile "${path.root}/profiles.json" file
 Create a profile "profiles.json" file at TF root directory to specified to the three user define profiles: network profile, network config profile and module config profile. When terraform apply command is executed on any IPM user case ns modules, the user defined profiles in the "${path.root}/profiles.json"shall be merged with the system defined network profiles.  Below are the specified formats for the user defined profiles.
```
 variable network_profiles {
  type = map(object({network_config_profile = optional(string), hub_config_profile: optional(string), leaf_config_profile: optional(string)}))
}

variable network_config_profiles {
    type = map(object({constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)}))
    description = "Map of Network Config profile"
    default =  {"network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
                "network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}}
}

variable module_config_profiles {
    type = map(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), 
    planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), 
    tx_clp_target: optional(string)}))
    description = "Map of hub and leaf config profiles"
}
```

**Example of ${path.root}/profiles.json content**
```
network_profiles = {
    "user_defined_network_profile1" = { network_config_profile: "user_defined_network_config_profile1", hub_config_profile: "user_defined_hub_profile1", leaf_config_profile:"user_defined_leaf_profile1"}
  }

network_config_profiles =  {"user_defined_network_config_profile1": { constellation_frequency: 194000000, modulation: "16QAM"}, 
                            "user_defined_network_config_profile2": { constellation_frequency: 194000000, modulation: "QPSK"}
}

module_config_profiles = { 
  "user_defined_hub_profile1" = {traffic_mode: "VTIMode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.3},
  "user_defined_hub_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3},
  "user_defined_leaf_profile1" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
  "user_defined_leaf_profile2" = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.3}
}
```

**Example of input network.tfvars file**
```
networks = [{name= "XR Network1", 
             network_profile = "user_defined_network_profile1", 
             hub_module = { identifier = {name = "PORT_MODE_HUB"}}, 
             leaf_modules=[{identifier =  {name = "PORT_MODE_LEAF1"}, config_profile = "user_defined_leaf_profile1"}]}]
```

### How To View The Existing Network Profiles
1. Create the following TF file in directory XXX
```
terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~> 0.4.0"
    }
  }
}

provider "ipm" {
  username = var.ipm_user     // TF_VAR_ipm_user
  password = var.ipm_password // TF_VAR_ipm_password
  host     = var.ipm_host     // TF_VAR_ipm_host
}

module "profiles" {
  source                   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//network-mgnmt/profiles"
}

output "network_profiles" {
  value = module.profiles.network_profiles
}

output "network_config_profiles" {
  value = module.profiles.network_config_profiles
}

output "module_config_profiles" {
  value = module.profiles.module_config_profiles
}
variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}
```
2. Add or create user defined profile "profile.json" file in the "XXX" directory.
3. To View the support profiles then execute
   a. terraform init 
   b. terraform apply


