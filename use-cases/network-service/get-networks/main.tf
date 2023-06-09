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

data "ipm_networks" "networks" {
  id = var.network_id
}

output "networks" {
  value = data.ipm_networks.networks
}


