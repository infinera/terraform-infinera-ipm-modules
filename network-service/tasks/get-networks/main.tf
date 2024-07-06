terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

data "ipm_networks" "networks" {
  id = var.id
}

output "networks" {
  value = data.ipm_networks.networks
}


