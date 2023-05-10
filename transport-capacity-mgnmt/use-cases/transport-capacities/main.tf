terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

module "profiles"  {
  source   = "../../profiles"
}

module "transport-capacities" {
  source                   = "../../tasks/transport-capacities"
  //source   = "git::https://github.com/infinera/terraform-ipm_modules.git//transport-capacity-mgnmt/tasks/transport-capacities"

  transport-capacities = var.transport-capacities
  tc_profiles         = module.profiles.tc_profiles

}

output "transport-capacities" {
  value = module.transport-capacities
}


