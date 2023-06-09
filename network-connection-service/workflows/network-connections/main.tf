terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

module "profiles" {
  source = "../../profiles"

  system_data_path = var.system_data_path
  user_data_path   = var.user_data_path
}

module "network_connection" {
  source              = "../../tasks/network-connections"
  network_connections = var.network_connections
}

output "network_connection" {
  value = module.network_connection
}


