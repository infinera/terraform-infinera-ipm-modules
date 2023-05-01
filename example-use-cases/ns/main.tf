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

module "network_by_module_name" {
  //source                   = "../../../common/workflows/network_by_module_name"
  source                   = "git::https://github.com/infinera/terraform-ipm_modules.git/common/workflows/network_by_module_name"
}

locals {
  networks = [for k, v in module.network_by_module_name.constellation_networks : {"Constellation Network" = v, "leaf_modules" = module.network_by_module_name.network_leaf_modules[k]}]
}


