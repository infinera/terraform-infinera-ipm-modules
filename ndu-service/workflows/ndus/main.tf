terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

module "profiles" {
  source = "../../../common/profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "ndus" {
  source              = "../../tasks/ndus"
  ndus = var.ndus
  profiles = module.profiles.profiles
}

output "ndus" {
  value = module.ndus
}


