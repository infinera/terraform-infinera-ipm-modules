terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_profiles = fileexists("${var.system_profile}") ? jsondecode(file("${var.system_profile}")) : { host_profiles : {} }

  user_profiles = fileexists("${user_profile}") ? jsondecode(file("${user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { host_profiles : {} }

  host_profiles = merge(local.user_profiles.host_profiles, local.system_profiles.host_profiles)
}

output "host_profiles" {
  value = local.host_profiles
}
