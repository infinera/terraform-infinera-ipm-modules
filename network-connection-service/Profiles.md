# XR Network Connection Profiles and Usages
The Network Connection profiles (AKA templates) are the common system and/or user defined configuration settings for the XR Network Connection. 
Usually the network designer shall define the common network profiles for the Network Connection and use these profiles in the Network Connection intents to create XR Network Connections with the same characteristics within or across sites, regions or domain networks. In addition, the user can override the XR  Network Connection profile settings in the intent as desired.
```
var network_connection_profile_specification {
  type = map(object({ service_mode = optional(string), mc = optional(string), outer_vid = optional(string),
                      implicit_transport_capacity = optional(string), labels = optional(map(string)), 
                      endpoint_capacity : optional(string) }))
   description = "NC Config profiles"
}
```

## Network Connection configuration profiles
The Network Connection Configuration Profile specifies the common configurations for XR Network Connection. 
| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| service_mode            | string |  PortMode or sharedDownlink    |     |                                               |
| mc            | string |      |     |                                               |
| outer_vid            | string |      |     |                                               |
| implicit_transport_capacity            | string |      |     |                                               |
| labels | Map(string) |     |  |                                   |
| endpoint_capacity | number |  |  |  The endpoints's capacity                                    |

**example**
```
{
  "profiles": {
    "nc_profile1": {
      "service_mode": "XR-L1"
    },
    "nc_profile2": {
      "service_mode": "XR-L1"
    }
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
   