terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

module "profiles" {
  source = "../../profiles"

  system_data_path = var.system_data_path
  user_profile     = var.user_profile
}

module "transport-capacities" {
  source = "../../tasks/transport-capacities"

  transport-capacities = var.transport-capacities
  tc_profiles          = module.profiles.tc_profiles

}

output "transport-capacities" {
  value = module.transport-capacities
}


