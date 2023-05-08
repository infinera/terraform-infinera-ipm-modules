terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_host_profiles = {
    "host_profile1" : { "managed_by" : "cm", "location" : {"latitude" : 335480, "longtitude" : -121.893028}, "labels" : {"region" : "West"}},
    "host_profile2" : { "managed_by" : "host", "location" : {"latitude" : 335480, "longtitude" : -121.893028}, "labels" : {"region" : "East"}},
  }

  profiles = jsondecode(file("${path.root}/profiles.json"))
  host_profiles  = local.profiles != null ? merge(local.system_host_profiles, local.profiles.host_profiles) : local.system_host_profiles
}

output "host_profiles" {
  value = local.host_profiles
}