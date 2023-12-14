terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~> 0.4.0"
    }
  }

}

module "profiles" {
  source = "../../../common/profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "modules" {
  source =  "../../tasks/modules"

  modules = var.modules
  module_profiles = module.profiles.profiles
}

output "modules" {
  value = module.modules
}