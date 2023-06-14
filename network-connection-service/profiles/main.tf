terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {

  system_profiles = fileexists("${var.system_profile}") ? jsondecode(file("${var.system_profile}")) : { nc_profiles : {} }

  user_profiles = fileexists("${var.user_profile}") ? jsondecode(file("${var.user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { nc_profiles : {} }

  nc_profiles = merge(local.user_profiles.nc_profiles, local.system_profiles.nc_profiles)
}

output "nc_profiles" {
  value = local.nc_profiles
}
