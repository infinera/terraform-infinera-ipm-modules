terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_nc_profiles = {
    "nc_profile1" : { service_mode : "portMode", mc : "matchOuterVID", outer_vid : "10,20,50..100", implicit_transport_capacity : "none", labels = {region: "West Coast"} },
    "nc_profile2" : { service_mode : "sharedDownlink", mc : "matchAll", outer_vid : "10,20,50..100", implicit_transport_capacity : "sharedDownlink", labels = {region: "East Coast"} }
  }

  profiles = jsondecode(file("${path.root}/profiles.json"))
  nc_profiles  = local.profiles != null ? merge(local.system_nc_profiles, local.profiles.nc_profiles) : local.system_nc_profiles
}

output "nc_profiles" {
  value = local.nc_profiles
}