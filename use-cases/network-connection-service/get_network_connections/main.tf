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

data "ipm_network_connections" "network_connections" {
  id = var.id
}

output "network_connections" {
  value = data.ipm_network_connections.network_connections
}
