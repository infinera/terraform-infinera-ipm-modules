terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {

  system_profiles = fileexists("${var.system_profile}") ? jsondecode(file("${var.system_profile}")) : { tc_profiles : {} }

  user_profiles = fileexists("${var.user_profile}") ? jsondecode(file("${var.user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { tc_profiles : {} }

  tc_profiles = merge(local.user_profiles.tc_profiles, local.system_profiles.tc_profiles)
}

output "tc_profiles" {
  value = local.tc_profiles
}
