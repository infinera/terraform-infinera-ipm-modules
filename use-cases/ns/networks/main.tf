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

