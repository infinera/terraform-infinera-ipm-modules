terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}

locals {
  system_profiles = fileexists("${var.system_data_path}/ndu_profiles.json") ? jsondecode(file("${var.system_data_path}/ndu_profiles.json")) : { ndu_profiles : {} }

  user_profiles = fileexists("${var.user_profile}") ? jsondecode(file("${var.user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { ndu_profiles : {} }

  ndu_profiles = merge(local.user_profiles.ndu_profiles, local.system_profiles.ndu_profiles)
}

output "ndu_profiles" {
  value = local.ndu_profiles
}
