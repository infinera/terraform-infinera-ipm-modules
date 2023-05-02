# Leaf Module By Module Name
This module support CRUD operation for constellation network's leaf device. 

# Expected Intent
| Input Variable         | Type   | Description                                   |
| -----------------------| -------|-----------------------------------------------|
| network_id             | String | Id of the constellation network               |
| leaf_modules           | List   | list of modules to be add to network          |
| config_profile         | Object | Module config settings                        |

## Leaf Modules
<pre>
variable leaf_modules {
  type = list(object({name: string, config: optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), tx_power_target_per_dsc: optional(number)}))}))
  description = "Leaf modules for specified network "
  default = [{name = "PORT_MODE_LEAF1"}, 
             {name = "PORT_MODE_LEAF2", <b>config</b> = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.2}}]
  }
</pre>
  The support attributes for leaf modules are shown in table below
  | Attribute  | Type   | Description                                                                       |
  | -----------| -------|-----------------------------------------------------------------------------------|
  | name       | string | Leaf Module Name                                                                  |
  | **config**     | object | This will override the profile configuration. Please see Module configuration profile below for support attributes |

## Module configuration profile. 
They specify the common configurations for Leaf Module.
```
  variable module_config_profiles {
    type = object({traffic_mode: optional(string),fiber_connection_mode: optional(string), tx_power_target_per_dsc: optional(number)})
    description = "Module config profile"
    default = {traffic_mode: "VTIMode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.3} 
  }
```
  The supported configured attributes are listed below
  | Attribute  | Type   | Description                                                                       |
  | -----------| -------|-----------------------------------------------------------------------------------|
  | traffic_mode                | string | Possible values: L1Mode, VTIMode                                 |
  | fiber_connection_mode       | string | Possible values: 16QAM, QPSK, 8QAM                               |
  | tx_power_target_per_dsc     | string | Carrier center frequency of the  module                          |


## Override the Module configuration profile settings
To override the Module configuration profile setting, the user can specify the Module configuration profile "config" in the leaf_modules intent as shown below for "XR Network1"
  <pre>
  // "XR Network1" network's leaf module "PORT_MODE_LEAF2" shall have traffic_mode set to "L1Mode" regardless of the setting in its leaf config profile ""leaf_config_profile"
  // "XR Network1" network's leaf module "PORT_MODE_LEAF1" shall be configured using the specification from leaf config profile "leaf_config_profile"
  leaf_modules = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2", <b>config</b> = {traffic_mode = "L1Mode"}}]},
                 {"XR Network2" = [{name = "PORT_MODE_LEAF3"}, {leaf_name = "PORT_MODE_LEAF4"}]}
  <pre>
# Use cases
## Add Leaf Module to Constellation Network "ABC"
### Intent (leaf_module.tfvars)
```
network_id = "ABC"
leaf_modules = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2"}]
module_config_profile = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.2}
```
## Steps
1. Go to "network" directory 
2. Terraform init (as needed)
3. Terraform apply with the input data. I.E. "terraform plan -var-file=leaf_module.tfvars” -var-file=profiles.tfvars” **(The profiles.tfvars is the system defined global profiles which can be customized by the user)**

## Updated Leaf Module "PORT_MODE_LEAF1" in Constellation Network "ABC"
### Intent (leaf_module.tfvars
Change fiber_connection_mode: **"Single"** to fiber_connection_mode: **"dual"**
```
network_id = "ABC"
leaf_modules = [{name = "PORT_MODE_LEAF2"}]
module_config_profile = {traffic_mode: "L1Mode",fiber_connection_mode: "dual", tx_power_target_per_dsc: -0.2}
```
## Steps
1. Go to "network_only_by_module_name" directory 
2. Terraform apply with the input data. I.E. "terraform plan -var-file=leaf_module.tfvars” -var-file=profiles.tfvars” 

## Remove Leaf Module "PORT_MODE_LEAF1" From Constellation Network "ABC"
### Intent (leaf_module.tfvars)
Remove **{name = "PORT_MODE_LEAF1"}**
```
network_id = "ABC"
leaf_modules = [~~{name = "PORT_MODE_LEAF1"},~~ {name = "PORT_MODE_LEAF2"}]
module_config_profile = {traffic_mode: "L1Mode",fiber_connection_mode: "single", tx_power_target_per_dsc: -0.2}
```
## Steps
1. Go to "network_only_by_module_name" directory 
2. Terraform apply with the input data. I.E. "terraform plan -var-file=leaf_module.tfvars”



