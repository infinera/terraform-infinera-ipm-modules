terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }

  }
}

data "ipm_networks" "networks" {
  id = var.id
}

output "networks" {
  value = data.ipm_networks.networks
}


