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

module "networks" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//network-service/workflows/networks"
  source = "../../../network-service/workflows/networks"

  networks       = var.networks
  system_profile = var.system_profile
  user_profile   = var.user_profile
}

output "networks" {
  value = module.networks
}
