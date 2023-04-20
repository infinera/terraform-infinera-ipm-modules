terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

provider "ipm" {
  username = "xr-user-1"
  password = "xr"
  host     = "https://pt-xrivk824-dv"
}

module "network_by_module_name" {

  source                   = "git::ssh://bitbucket.infinera.com:7999/mar/terraform-ipm-modules.git//common/workflows/network_by_module_name"
  //source                   = "../../../common/workflows/network_by_module_name"
  networks                 = var.networks
  leaf_modules             = var.leaf_modules
}
