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

  source                   = "git::https://github.com/infinera/terraform-ipm_modules.git//common/workflows/network_by_module_name"
  //source                   = "../../../common/workflows/network_by_module_name"
  networks                 = var.networks
  leaf_modules             = var.leaf_modules
}
