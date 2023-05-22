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

module "network_connections" {
  source   = "git::https://github.com/infinera/terraform-ipm_modules.git//network-connection-service/workflows/network-connections"

  network_connections = var.network_connections
  profile_path = var.ipm_profile_path
}

output "network_connection" {
  value = module.network_connections
}


