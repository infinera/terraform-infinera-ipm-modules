
module "profiles" {
  source = "../../../common/profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "module_softwares" {
  source              = "../../tasks/module_softwares"
  module_softwares = var.module_softwares
  profiles = module.profiles.profiles
}

output "module_softwares" {
  value = module.module_softwares
}


