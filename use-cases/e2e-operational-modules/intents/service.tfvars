networks = [{ network_name = "XR Network1",
              profile = "network_profile1",
              hub_module = { identifier = {module_name = "PORT_MODE_HUB"} },
              leaf_modules = [{identifier = { module_name = "PORT_MODE_LEAF1" }}] 
            }]

transport-capacities = [{ name = "tc1", profile = "system_tc_profile1",
                          endpoints = [{ identifier = {module_name = "PORT_MODE_HUB", module_client_if_aid= "XR-T1"} }, 
                                       {identifier = { module_name = "PORT_MODE_LEAF1", module_client_if_aid= "XR-T1" }}] 
                            }]