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
  source                   = "../../../common/workflows/network"
  //source                   = "git::https://github.com/infinera/terraform-ipm_modules.git//common/workflows/network"
}

locals {
  networks = [for k, v in module.network.networks : {"Constellation Network" = v, "leaf_modules" = module.network.network_leaf_modules[k]}]
}


