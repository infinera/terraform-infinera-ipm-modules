terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

module "profiles"  {
  source   = "../../profiles"

  profile_path = var.profile_path
}

module "network_connection" {
  source                   =  "../../tasks/network-connections"
  network_connections = var.network_connections
}

output "network_connection" {
  value = module.network_connection
}


