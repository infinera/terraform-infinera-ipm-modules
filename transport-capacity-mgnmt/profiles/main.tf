terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {

  system_profiles = jsondecode(file("${var.profile_path}/tc_profiles.json"))

  user_profiles = jsondecode(file("${path.root}/${var.user_profile_name}"))
  
  tc_profiles  = local.user_profiles != null ? merge(local.system_profiles.tc_profiles, local.user_profiles.tc_profiles) : local.system_profiles.tc_profiles
}

output "tc_profiles" {
  value = local.tc_profiles
}