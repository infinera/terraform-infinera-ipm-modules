terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}
locals {
  system_profiles = fileexists("${var.system_profile}") ? jsondecode(file("${var.system_profile}")) : { event_profiles : {} }

  user_profiles = fileexists("${var.user_profile}") ? jsondecode(file("${var.user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { event_profiles : {} }

  event_profiles = merge(local.user_profiles.event_profiles, local.system_profiles.event_profiles)
}

output "event_profiles" {
  value = local.event_profiles
}
