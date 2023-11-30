networks = []

transport_capacities = [{ name = "tc1", profile = "system_tc_profile1",
  end_points = [{ identifier = { serial_number = "MA222233A005", module_client_if_aid = "XR-T1" }, capacity = 100 }]}
]

network_connections = [
  { name = "nc1", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T1", serial_number = "MA222233A005" }, capacity = 100 }] }
] 
 
