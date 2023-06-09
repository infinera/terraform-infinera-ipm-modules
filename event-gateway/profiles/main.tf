terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}
locals {
  system_profiles = fileexists("${var.system_data_path}/event_profiles.json") ? jsondecode(file("${var.system_data_path}/event_profiles.json")) : { event_profiles : {} }

  user_profiles = fileexists("${var.user_data_path}/event_profiles.json") ? jsondecode(file("${var.user_data_path}/event_profiles.json")) : fileexists("${path.root}/event_profiles.json") ? jsondecode(file("${path.root}/event_profiles.json")) : { event_profiles : {} }

  event_profiles = merge(local.user_profiles.event_profiles, local.system_profiles.event_profiles)
}

output "event_profiles" {
  value = local.event_profiles
}
