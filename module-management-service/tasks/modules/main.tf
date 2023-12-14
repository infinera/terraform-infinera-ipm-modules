terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}


locals {
   modules = { for module in var.modules : module.identifier.module_name != null ? module.identifier.module_name : module.identifier.module_id != null ? module.identifier.module_id : module.identifier.module_serial_number != null ? module.identifier.module_serial_number : module.identifier.module_mac_address != null ? module.identifier.module_mac_address : "" => module }
}

data "ipm_modules" "modules" {
  for_each = local.modules
    name = each.value.identifier.module_name != null ? each.value.identifier.module_name : null
    id = each.value.identifier.module_id != null ? each.value.identifier.module_id : null
    serial_number = each.value.identifier.module_serial_number != null ? each.value.identifier.module_serial_number : null
    mac_address = each.value.identifier.module_mac_address != null ? each.value.identifier.module_mac_address : null
}

resource "ipm_module" "modules" {
  for_each = local.modules
    identifier = {
      device_id = data.ipm_modules.modules[each.key].modules[0].id
    }
    config = {
      module_name = each.value.module_name != null ? each.value.module_name : null
      m_vlan_mode = each.value.m_vlan_mode != null ? each.value.m_vlan_mode : each.value.profile != null ? var.module_profiles[each.value.profile].m_vlan_mode : null
      debug_port_access   = each.value.debug_port_access != null ? each.value.debug_port_access : each.value.profile != null ? var.module_profiles[each.value.profile].debug_port_access : null
      labels     = each.value.labels != null ? each.value.labels : each.value.profile != null ? var.module_profiles[each.value.profile].labels : null
    }
}