

module "system_profile" {
  source = "../get_profiles"
  profile = var.system_profile
}
module "user_profile" {
  source = "../get_profiles"
  profile = var.user_profile
}

locals {

  system_profiles = length(module.system_profile.profiles) > 0 ? module.system_profile.profiles : { profiles : {} } 

  user_profiles = length(module.user_profile.profiles) > 0 ? module.user_profile.profiles : { profiles : {} } 

  profiles = merge(local.user_profiles.profiles, local.system_profiles.profiles)
}

output "profiles" {
  value = local.profiles
}

variable "system_profile" {
  type = string
}

variable "user_profile" {
  type = string
}


