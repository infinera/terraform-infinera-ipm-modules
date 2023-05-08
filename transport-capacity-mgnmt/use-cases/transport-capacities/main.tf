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

module "network_connection" {
  //source                   = "../../../common/workflows/network"
  source   = "git::https://github.com/infinera/terraform-ipm_modules.git//network-connection-mgnmt/tasks/network-connection"
  networks = var.network_connections
}

output "network_connection" {
  value = module.network_connection
}


