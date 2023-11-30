transport_capacities = [{ name = "tc1", profile = "system_tc_profile1",
  end_points = [{ identifier = { module_name = "Test_HUB1", module_client_if_aid = "XR-T1" }, capacity = 100 },
  { identifier = { module_name = "Test_LEAF1", module_client_if_aid = "XR-T1" }, capacity = 100 }]
  },
  { name = "tc2", profile = "system_tc_profile1",
  end_points = [{ identifier = { module_name = "Test_HUB1", module_client_if_aid = "XR-T2" }, capacity = 100 },
  { identifier = { module_name = "Test_LEAF2", module_client_if_aid = "XR-T1" }, capacity = 100 }]
  }
]

