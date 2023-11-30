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

module "transport_capacities" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//transport-capacity-service/workflows/transport_capacities"
  source = "../../../transport-capacity-service/workflows/transport_capacities"

  transport_capacities = var.transport_capacities
  system_profile       = var.system_profile
  user_profile         = var.user_profile
}

output "transport_capacities" {
  value = module.transport_capacities
}

