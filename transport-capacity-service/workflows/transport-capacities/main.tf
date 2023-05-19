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

module "transport-capacities" {
  source                   = "../../tasks/transport-capacities"

  transport-capacities = var.transport-capacities
  tc_profiles          = module.profiles.tc_profiles

}

output "transport-capacities" {
  value = module.transport-capacities
}

