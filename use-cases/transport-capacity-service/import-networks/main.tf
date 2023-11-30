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
  to = ipm_transport_capacity.transport_capacities
  id = "24816f34-bf25-476f-928d-62f5e4a1aced"
}
