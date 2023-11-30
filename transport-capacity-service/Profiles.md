# Transport Capacity Profiles and Usages
The Transport Capacity profiles (AKA templates) are the common system and/or user defined configuration settings for the Transport Capacity. 
Usually the network designer shall define the common network profiles for the transport capacity and use these profiles in the transport capacity intents to create XR Transport Capacity with the same characteristics within or across sites, regions or domain networks. In addition, the user can override the profile settings in the intent as desired.
```
variable "transport_capacity_profile_specification" {
  type = map(object({ capacity_mode = optional(string), labels = optional(map(string)), endpoint_capacity : optional(number)}))
  description = "Map of tc profiles"
}
```

## Transport Capacity configuration profiles
The Transport Capacity Configuration Profile specifies the common configurations for XR Transport Capacity. 
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| capacity_mode            | string |  PortMode or sharedDownlink    |     |                                               |
| labels            | string[] |     |     |                                               |
| endpoint_capacity | number |  |  |  The endpoints's capacity                                    |

**Example**
```
{
  "profiles" : {
      "system_tc_profile1" : { "capacity_mode" : "portMode", "labels" : { "region" : "South"}, "endpoint_capacity" : 100 }, 
      "system_tc_profile2" :  { "capacity_mode" : "portMode", "labels" : { "region" : "North"}, "endpoint_capacity" : 100 }
  }
}
```

## How to Override The Transport Capacity Configuration Profile Settings
### __Steps__
1. To override the Transport Capacity configuration profile setting, the user can specify the inline configuration in the Transport capacity intent. In the example below the **capacity_mode** is overriden to "portMode" regardless of the profile setting.
```
transport_capacities = [{ name = "tc1", profile = "system_tc_profile1", capacity_mode = "portMode"
  end_points = [{ identifier = { module_name = "Test_HUB1", module_client_if_aid = "XR-T1" }, capacity = 100 },
  { identifier = { module_name = "Test_LEAF1", module_client_if_aid = "XR-T1" }, capacity = 100 }]
  }
]
```
2. Execute TF configuration networks.sh command
   