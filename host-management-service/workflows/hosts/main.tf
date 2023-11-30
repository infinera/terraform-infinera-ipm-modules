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

module "hosts" {
  source = "../../tasks/hosts"

  hosts = var.hosts
  profiles = module.profiles.profiles

}

output "hosts" {
  value = module.host.hosts
}


