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

data "ipm_transport_capacities" "tcs" {
  id = var.id
}

output "tcs" {
  value = data.ipm_transport_capacities.tcs
}


