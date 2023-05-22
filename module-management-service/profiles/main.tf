terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {

  system_profiles = fileexists("${var.profile_path}/module_profiles.json")? jsondecode(file("${var.profile_path}/module_profiles.json")) : {module_profiles : {}}

  user_profiles = fileexists("${path.root}/module_profiles.json")? jsondecode(file("${path.root}/module_profiles.json")) : {module_profiles : {}}
  
  module_profiles  = merge(local.user_profiles.module_profiles, local.system_profiles.module_profiles)
}

output "module_profiles" {
  value = local.module_profiles
}