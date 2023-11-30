networks = []

transport_capacities = [{ name = "tc1", profile = "system_tc_profile1",
  end_points = [{ identifier = { mac_address = "0A:CB:F8:FF:00:08", module_client_if_aid = "XR-T1" }, capacity = 100 },
                { identifier = { mac_address = "0A:CB:F8:FF:00:09", module_client_if_aid = "XR-T1" }, capacity = 100 }]},
  { name = "tc2", profile = "system_tc_profile1",
    end_points = [{ identifier = { mac_address = "0A:CB:F8:FF:00:08", module_client_if_aid = "XR-T2" }, capacity = 100 },
                  { identifier = { mac_address = "0A:CB:F8:FF:00:10", module_client_if_aid = "XR-T1" }, capacity = 100 }]
  }
]

network_connections = [
  { name = "nc1", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T1", mac_address = "0A:CB:F8:FF:00:08" }, capacity = 100 }, 
                { identifier = { module_client_if_aid = "XR-T1", mac_address = "0A:CB:F8:FF:00:09" }, capacity = 100 }] },
  { name = "nc2", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T2", mac_address = "0A:CB:F8:FF:00:08" }, capacity = 100 }, 
                  { identifier = { module_client_if_aid = "XR-T1", mac_address = "0A:CB:F8:FF:00:10" }, capacity = 100 }] }
] 
