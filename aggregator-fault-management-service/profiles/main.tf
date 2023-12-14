
locals {
  system_profiles = fileexists("${var.system_profile}") ? jsondecode(file("${var.system_profile}")) : { agregator_fault_profiles : {} }

  user_profiles = fileexists("${var.user_profile}") ? jsondecode(file("${var.user_profile}")) : fileexists("${path.root}/${var.user_profile}") ? jsondecode(file("${path.root}/${var.user_profile}")) : { agregator_fault_profiles : {} }

  agregator_fault_profiles = merge(local.user_profiles.agregator_fault_profiles, local.system_profiles.agregator_fault_profiles)
}

output "agregator_fault_profiles" {
  value = local.agregator_fault_profiles
}
