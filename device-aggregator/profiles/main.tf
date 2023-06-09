terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}
locals {
  system_profiles = fileexists("${var.system_data_path}/device_profiles.json") ? jsondecode(file("${var.system_data_path}/device_profiles.json")) : { device_profiles : {} }

  user_profiles = fileexists("${var.user_data_path}/device_profiles.json") ? jsondecode(file("${var.user_data_path}/device_profiles.json")) : fileexists("${path.root}/device_profiles.json") ? jsondecode(file("${path.root}/device_profiles.json")) : { device_profiles : {} }

  device_profiles = merge(local.user_profiles.device_profiles, local.system_profiles.device_profiles)
}

output "device_profiles" {
  value = local.device_profiles
}
