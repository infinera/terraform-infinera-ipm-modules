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

module "network_connections" {
  //source   = "git::https://github.com/infinera/terraform-ipm_modules.git//network-connection-service/workflows/network-connections"
  source = "../../../network-connection-service/workflows/network-connections"

  network_connections       = var.network_connections
  system_profile = var.system_profile
  user_profile   = var.user_profile
}

output "network_connection" {
  value = module.network_connections
}


