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

import {
  to = ipm_constellation_network.constellation_network
  id = "f3d6b443-1910-4de2-838b-3f56faf4aa8b"
}

resource "ipm_constellation_network" "constellation_network" {
  config = {
    name = "XRNETWORK2"
    constellation_frequency = 196100000
    modulation = null
    tc_mode = null
    managed_by  = null
    topology = null
  }
  hub_module = {
    config = {
      selector = { 
        module_selector_by_module_name = {module_name = "unknown" }
      }
      module = {
        traffic_mode = null
        fiber_connection_mode = null
        planned_capacity  = null
        requested_nominal_psd_offset =  null
        fec_iterations = null
        tx_clp_target = 0
        MaxDSCs = 0
        MaxTxDSCs = 0
        AllowedTxCDSCs = []
        AllowedRxCDSCs = []
      }
      managed_by = "unknown"
    }
  }
  # (other resource arguments...)
}
