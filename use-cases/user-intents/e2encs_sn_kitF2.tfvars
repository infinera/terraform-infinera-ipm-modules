networks = [{ network_name = "XR Network kitF" ,
              profile = "network_profile1",
              hub_module = { identifier = {serial_number = "MA222233A005"} },
              leaf_modules = [{identifier = { serial_number = "MA222243A01B" }, tx_clp_target = "-10000", requested_nominal_psd_offset = "+6dB"}]
            }]

transport_capacities = [{ name = "tc1", profile = "system_tc_profile1",
  end_points = [{ identifier = { serial_number = "MA222233A005", module_client_if_aid = "XR-T1" }, capacity = 100 },
                { identifier = { serial_number = "MA222243A01B", module_client_if_aid = "XR-T1" }, capacity = 100 }]}
]

network_connections = [
  { name = "nc1", profile = "nc_profile1",
    end_points = [{ identifier = { module_client_if_aid = "XR-T1", serial_number = "MA222233A005" }, capacity = 100 }, 
                { identifier = { module_client_if_aid = "XR-T1", serial_number = "MA222243A01B" }, capacity = 100 }] }
] 
 
