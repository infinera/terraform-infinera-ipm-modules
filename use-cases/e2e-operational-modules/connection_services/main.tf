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

module "networks" {
  //source   = "git::https://github.com/infinera/terraform-ipm_modules.git//network-service/workflows/networks"
  source = "../../../network-service/workflows/networks"

  networks         = var.networks
  system_data_path = var.system_data_path
  user_profile     = var.user_profile
}


module "transport-capacities" {
  //source   = "git::https://github.com/infinera/terraform-ipm_modules.git//transport-capacity-service/workflows/transport-capacities"
  source     = "../../../transport-capacity-service/workflows/transport-capacities"
  depends_on = [module.networks]

  transport-capacities = var.transport-capacities
  system_data_path     = var.system_data_path
  user_profile         = var.user_profile
}
