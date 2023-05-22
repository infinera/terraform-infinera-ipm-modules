terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
    experiments = [module_variable_optional_attrs]
  }
}

provider "ipm" {
  username = var.ipm_user
  password = var.ipm_password
  host     = var.ipm_host
}

data "ipm_network_connections" "network_connections" {
  //id = "5ff66884-bf1b-4e77-8340-ec9d739c7ca8"
}

output "network_connections" {
  value = data.ipm_network_connections.network_connections
}