terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {

  system_profiles = fileexists("${var.system_data_path}/tc_profiles.json") ? jsondecode(file("${var.system_data_path}/tc_profiles.json")) : { tc_profiles : {} }

  user_profiles = fileexists("${user_profile}") ? jsondecode(file("${user_profile}")) : fileexists("${path.root}/${user_profile}") ? jsondecode(file("${path.root}/${user_profile}")) : { tc_profiles : {} }

  tc_profiles = merge(local.user_profiles.tc_profiles, local.system_profiles.tc_profiles)
}

output "tc_profiles" {
  value = local.tc_profiles
}
