terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

module "profiles" {
  source = "../../../common/profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "network_connections" {
  source              = "../../tasks/network_connections"
  network_connections = var.network_connections
  profiles = module.profiles.profiles
}

output "network_connections" {
  value = module.network_connections
}


