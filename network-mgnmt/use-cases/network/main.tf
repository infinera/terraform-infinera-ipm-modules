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

module "network" {
  source   = "git::https://github.com/infinera/terraform-ipm_modules.git//network-mgnmt/workflows/network"

  networks = var.networks
  profile_path = var.ipm_profile_path
}

output "network" {
  value = module.network
}


