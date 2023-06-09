terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {
  system_profiles = fileexists("${var.system_data_path}/sw_manager_profiles.json") ? jsondecode(file("${var.system_data_path}/sw_manager_profiles.json")) : { sw_manager_profiles : {} }

  user_profiles = fileexists("${var.user_data_path}/sw_manager_profiles.json") ? jsondecode(file("${var.user_data_path}/sw_manager_profiles.json")) :  fileexists("${path.root}/sw_manager_profiles.json") ? jsondecode(file("${path.root}/sw_manager_profiles.json")) : { sw_manager_profiles : {} }

  sw_manager_profiles = merge(local.user_profiles.sw_manager_profiles, local.system_profiles.sw_manager_profiles)
}

output "sw_manager_profiles" {
  value = local.sw_manager_profiles
}
