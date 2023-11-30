terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

module "modules" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//module-management-service/workflows/modules"
  source =  "../../../module-management-service/workflows/modules"

  modules = var.modules
  system_profile      = var.system_profile
  user_profile        = var.user_profile
}

output "modules" {
  value = module.modules
}


