terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }

}
locals {
  system_profiles = fileexists("${var.system_data_path}/domain_fault_profiles.json") ? jsondecode(file("${var.system_data_path}/domain_fault_profiles.json")) : { domain_fault_profiles : {} }

  user_profiles = fileexists("${var.user_data_path}/domain_fault_profiles.json") ? jsondecode(file("${var.user_data_path}/domain_fault_profiles.json")) : fileexists("${path.root}/domain_fault_profiles.json") ? jsondecode(file("${path.root}/domain_fault_profiles.json")) : { domain_fault_profiles : {} }

  domain_fault_profiles = merge(local.user_profiles.domain_fault_profiles, local.system_profiles.domain_fault_profiles)
}

output "domain_fault_profiles" {
  value = local.domain_fault_profiles
}
