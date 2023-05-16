terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}


module "profiles"  {
  source   = "../../profiles"

  profile_path = var.profile_path
}

module "hosts" {
  source           = "../../../tasks/hosts"

  hosts = var.hosts
}

output "hosts" {
  value = module.host.hosts
}


