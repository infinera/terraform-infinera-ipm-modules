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

module "hosts" {
  //source                   = "../../../common/workflows/network"
  source   = "git::https://github.com/infinera/terraform-ipm_modules.git//hosts/tasks/hosts"
  hosts = var.hosts
}

output "hosts" {
  value = module.host.hosts
}


