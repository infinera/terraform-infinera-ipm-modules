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
  id = "ab53119d-8597-4bf0-922c-05583ef78a3b"
}
