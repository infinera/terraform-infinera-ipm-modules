terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  system_profiles = fileexists("${var.profile_path}/host_profiles.json")? jsondecode(file("${var.profile_path}/host_profiles.json")) : {host_profiles : {}}

  user_profiles = fileexists("${path.root}/host_profiles.json")? jsondecode(file("${path.root}/host_profiles.json")) : {host_profiles : {}}
  
  host_profiles  = merge(local.user_profiles.host_profiles, local.system_profiles.host_profiles)
}

output "host_profiles" {
  value = local.host_profiles
}