terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

module "network_by_module_name" {
  source                   = "../../../common/workflows/network_by_module_name"
  networks                 = var.networks
  leaf_modules             = var.leaf_modules
}

locals {
  networks = [for k, v in module.network_by_module_name.constellation_networks : {"Constellation Network" = v, "leaf_modules" = module.network_by_module_name.network_leaf_modules[k]}]
}


