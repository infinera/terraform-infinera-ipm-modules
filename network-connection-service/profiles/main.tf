terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {

  system_profiles = fileexists("${var.profile_path}/nc_profiles.json")? jsondecode(file("${var.profile_path}/nc_profiles.json")) : {nc_profiles : {}}

  user_profiles = fileexists("${path.root}/nc_profiles.json")? jsondecode(file("${path.root}/nc_profiles.json")) : {nc_profiles : {}}
  
  nc_profiles  = merge(local.user_profiles.nc_profiles, local.system_profiles.nc_profiles)
}

output "nc_profiles" {
  value = local.nc_profiles
}