
module "profiles" {
  source = "../../../common/profiles"

  system_profile = var.system_profile
  user_profile   = var.user_profile
}

module "transport_capacities" {
  source = "../../tasks/transport_capacities"

  transport_capacities = var.transport_capacities
  profiles          = module.profiles.profiles

}

output "transport_capacities" {
  value = module.transport_capacities
}