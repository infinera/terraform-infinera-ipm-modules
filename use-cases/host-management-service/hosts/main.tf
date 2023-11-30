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
  //source = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//host-management-service/workflows/hosts"
  source = "../../../host-management-service/workflows/hosts"

  hosts          = var.hosts
  system_profile = var.system_profile
  user_profile   = var.user_profile
}

output "hosts" {
  value = module.host.hosts
}


