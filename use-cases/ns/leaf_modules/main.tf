terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

locals {
  networkMap = { for network in var.networks : network.name => network.id }
}

module "ns_profiles"  {
  source   = "../../../common/profiles/ns_profiles"
}

module "leaf_module_by_module_name" {
  source                 = "../../../common/tasks/leaf_module_by_module_name"

  for_each                  = local.networkMap
  network_id                = each.value
  leaf_modules              = var.leaf_modules[each.key]
  module_config_profiles    = module.ns_profiles.module_config_profiles
}
