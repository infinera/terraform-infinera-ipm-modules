terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

provider "ipm" {
  username = var.ipm_user
  password = var.ipm_password
  host     = var.ipm_host
}

/*import {
  to = ipm_constellation_network.constellation_network
  id = "f3d6b443-1910-4de2-838b-3f56faf4aa8b"
}*/

resource "ipm_constellation_network" "constellation_network" {
  config = {
    name = "unknown"
    constellation_frequency = 0
    modulation = "unknown"
    tc_mode = true
    managed_by  = "unknown"
    topology = "unknown"
  }
  hub_module = {
    config = {
      selector = { 
        module_selector_by_module_name = {module_name = "unknown" }
      }
      module = {
        traffic_mode = "unknown"
        fiber_connection_mode = "unknown"
        planned_capacity  = "unknown"
        requested_nominal_psd_offset =  "unknown"
        fec_iterations = "unknown"
        tx_clp_target = 0
        MaxDSCs = []
        MaxTxDSCs = []
        AllowedTxCDSCs = []
        AllowedRxCDSCs = []
      }
      managed_by = "unknown"
    }
  }
  # (other resource arguments...)
}
