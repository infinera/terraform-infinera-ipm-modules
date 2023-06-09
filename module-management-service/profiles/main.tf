terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {

  system_profiles = fileexists("${var.system_data_path}/module_profiles.json") ? jsondecode(file("${var.system_data_path}/module_profiles.json")) : { module_profiles : {} }

  user_profiles = fileexists("${var.user_profile}") ? jsondecode(file("${var.user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { module_profiles : {} }

  module_profiles = merge(local.user_profiles.module_profiles, local.system_profiles.module_profiles)
}

output "module_profiles" {
  value = local.module_profiles
}
