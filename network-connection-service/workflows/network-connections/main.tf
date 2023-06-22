terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

module "profiles" {
  source = "../../profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "network_connection" {
  source              = "../../tasks/network-connections"
  network_connections = var.network_connections
  nc_profiles = module.profiles.nc_profiles
}

output "network_connection" {
  value = module.network_connection
}


