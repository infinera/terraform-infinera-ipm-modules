# Constellation Network 
The user can create one or more constellation networks by specify the desired intent for the networks and their leaf modules.

# Create and Update Constellation Network From the Intent 
## Example of The Creating Network with two leaf modules
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1
                                             |
                                             |-----> leaf2 = PORT_MODE_LEAF2
```
Create a new directory for network service terraform test. This directory contains two terraform files: main.tf, variables.tf and the intent network.tfvars.
## The intent - network.tfvars
Please see sample intent files in <b>bitbucket.infinera.com:7999/mar/terraform-ipm-modules.git//use-cases/ns/input-data</b> directory
```
networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", <b>network_profile</b> = "network_profile1"}]

leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2"}]}
```

## The TF files
### main.tf
```
terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

provider "ipm" {
  username = "xxx"
  password = "yyy"
  host     = "abc"
}

module "network" {
  source                   = "git::ssh://bitbucket.infinera.com:7999/mar/terraform-ipm-modules.git//use-cases/ns/network"
  <b>networks</b>                 = var.networks 
  <b>leaf_modules</b>             = var.leaf_modules
}
```

### variables.tf
```
variable networks {
  type = list(object({name= optional(string), hub_name = optional(string), network_profile = optional(string), config=optional(object({name=optional(string),constellation_frequency= optional(number), modulation = optional(string), managed_by=optional(string), tc_mode=optional(string)})), hub_config = optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))}))
  description = "List of constellation Network"
  default = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", network_profile = "network_profile1", config={modulation: "16QAM"}, hub_config = {traffic_mode = "VTIMode"}}]
             //,{name= "XR Network2", hub_name = "VTI_MODE_HUB", network_profile = "network_profile2"}]
}

variable leaf_modules {
  type = map(list(object({name: string, config_profile = optional(string), config: optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), managed_by: optional(string), planned_capacity: optional(string), requested_nominal_psd_offset: optional(string), fec_iterations: optional(string), tx_clp_target: optional(string)}))})))
  description = "Leaf modules for specified network name "
  default = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2",config={traffic_mode: "VTIMode"}}],
             "XR Network2" = [{name = "PORT_MODE_LEAF3"}, {name = "PORT_MODE_LEAF4"}]}
}
```

## Create New XR Network
Go to the main.tf file's directory and execute the following commands
1. terraform init
2. terraform apply -var-file=xxx/network.tfvars
   The network "XR Network1" with hub "PORT_MODE_HUB" and leaf modules : "PORT_MODE_LEAF1" and"PORT_MODE_LEAF2" shall be created.

## Add New Leaf Module to the just Created XR Network
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
  networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", network_profile = "network_profile1"}]

  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2"}, {name = "PORT_MODE_LEAF3"}]}
```
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   Leaf module "PORT_MODE_LEAF3" is added to the network "XR Network1".

## Remove Leaf Module From The Created XR Network
```
XR Network1  (hub=PORT_MODE_HUB)-------------|-----> leaf 1 = PORT_MODE_LEAF1
```
In the same directory, follow these steps
1. Update the intent file **network.tfvars** to remove two leaf modules ""PORT_MODE_LEAF2" and "PORT_MODE_LEAF3".
```
  networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", network_profile = "network_profile1"}]

  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}]}
```
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   Both Leaf module2 "PORT_MODE_LEAF2" and "PORT_MODE_LEAF3" are deleted from the network "XR Network1".

## Update The Configuration of the Created XR Network, its Hub and Leaf Modules
The network configuration, its hub and leaf configuration are configured by the **network profile"** settings. The **network profile** settings shall include the profile specifications for the network configurations, its hub module configurations and its leaf modules configurations. All the configuration profile's settings can be overridden by specifying the specific configuration settings in the intent. Please see the **Profiles** section for more information.

### Update The Configuration Settings For the XR Network and all its Modules
In the same directory, follow these steps
1. Update the intent file to change the network's configuration.
  <pre>
  <b>network.tfvars</b>

  networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", <b>network_profile = "network_profile2"</b>}]

  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}]}
  </pre>
2. Execute commands **terraform apply -var-file=xxx/network.tfvars**. 
   This actions will update teh network and its modules configurations based on the setting specifications in the new <b>network profile "network_profile2"</b>

### Update The Configuration Settings for the XR Network
In the same directory, follow these steps
1. Update the intent file to change the network's configuration.
  <pre>
  <b>network.tfvars</b>

  networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", network_profile = "network_profile1", <b>config={name="aaa"",constellation_frequency= 193000, modulation = "16QAM", managed_by="cm", tc_mode=true}</b>}]

  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}]}
  </pre>
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   The network "Network1" configuration shall be updated base on the **config** specifications.

### Update The Configuration Settings for the Hub Module of an XR Network
In the same directory, follow these steps
1. Update the intent file to override the configuration of the Hub module of a constellation network
  <pre>
  <b>network.tfvars</b>

  networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", network_profile = "network_profile1", <b>hub_config={traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G", requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500}</b>}]

  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}]}
  </pre>
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   The hub module's configuration of the network "Network1" shall be updated base on the **hub_config** specifications.

### Update The Configuration Settings for the Leaf Modules of an XR Network
In the same directory, follow these steps
1. Update the intent file to override the configuration of the leaf modules of a constellation network
  <pre>
  <b>network.tfvars</b>

  networks = [{name= "XR Network1", hub_name = "PORT_MODE_HUB", network_profile = "network_profile1", <b>hub_config={traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G", requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500}</b>}]

  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1", <b>config_profile = "leaf_profile2"</b>},
                                  {name = "PORT_MODE_LEAF2", <b>config={traffic_mode: "L1Mode",fiber_connection_mode: "single"", managed_by: "cm"", planned_capacity: "400G", requested_nominal_psd_offset: "+3dB", fec_iterations: "standard", tx_clp_target: -3500}</b>}]}
  </pre>
2. execute commands **terraform apply -var-file=xxx/network.tfvars** 
   1. The "PORT_MODE_LEAF1" leaf module's configuration of the network "Network1" shall be updated base on the **config_profile** specifications.
   2. The "PORT_MODE_LEAF2" leaf module's configuration of the network "Network1" shall be updated base on the **config** specifications.
