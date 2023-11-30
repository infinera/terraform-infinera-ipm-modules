network_connections = [
  { name = "nc1", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T1", serial_number = "000000008" }, capacity = 100 }, 
                { identifier = { module_client_if_aid = "XR-T1", serial_number = "000000009" }, capacity = 100 }] },
  { name = "nc2", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T2", serial_number = "000000008" }, capacity = 100 }, 
                  { identifier = { module_client_if_aid = "XR-T1", serial_number = "000000010" }, capacity = 100 }] }
] 

