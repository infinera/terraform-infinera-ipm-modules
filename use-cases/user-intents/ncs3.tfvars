network_connections = [
  { name = "nc1", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T1", module_name = "Test_HUB1" }, capacity = 100 }, { identifier = { module_client_if_aid = "XR-T1", module_name = "Test_LEAF1" }, capacity = 100 }] },
  { name = "nc2", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T2", module_name = "Test_HUB1" }, capacity = 100 }, { identifier = { module_client_if_aid = "XR-T1", module_name = "Test_LEAF2" }, capacity = 100 }] }
]
