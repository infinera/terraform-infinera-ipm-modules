terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {

  system_profiles = fileexists("${var.profile_path}/tc_profiles.json")? jsondecode(file("${var.profile_path}/tc_profiles.json")) : null

  user_profiles = fileexists("${path.root}/tc_profiles.json")? jsondecode(file("${path.root}/tc_profiles.json")) : null
  
  tc_profiles  = local.user_profiles != null ? merge(local.user_profiles.tc_profiles, local.system_profiles != null ? local.system_profiles.tc_profiles: {}) : local.system_profiles != null ? local.system_profiles.tc_profiles: {}
}

output "tc_profiles" {
  value = local.tc_profiles
}