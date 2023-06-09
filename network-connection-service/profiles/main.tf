terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {

  system_profiles = fileexists("${var.system_data_path}/nc_profiles.json") ? jsondecode(file("${var.system_data_path}/nc_profiles.json")) : { nc_profiles : {} }

  user_profiles = fileexists("${var.user_data_path}/nc_profiles.json") ? jsondecode(file("${var.user_data_path}/nc_profiles.json")) : fileexists("${path.root}/nc_profiles.json") ? jsondecode(file("${path.root}/nc_profiles.json")) : { nc_profiles : {} }

  nc_profiles = merge(local.user_profiles.nc_profiles, local.system_profiles.nc_profiles)
}

output "nc_profiles" {
  value = local.nc_profiles
}
