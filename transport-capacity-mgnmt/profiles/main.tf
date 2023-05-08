terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_tc_profiles = {
    "system_tc_profile1" : { labels = {region: "West Coast"}, capacity_mode : "portMode", endpoint_capacity : 400 },
    "system_tc_profile2" : { labels = {region: "East Coast"},  capacity_mode : "sharedDownlink", endpoint_capacity : 100 }
  }

  profiles = jsondecode(file("${path.root}/profiles.json"))
  tc_profiles  = local.profiles != null ? merge(local.system_tc_profiles, local.profiles.tc_profiles) : local.system_tc_profiles
}

output "tc_profiles" {
  value = local.tc_profiles
}