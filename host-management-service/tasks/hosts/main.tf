terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

// Constellation Network Resource supports CRUD functions
resource "ipm_host" "hosts" {
  for_each = { for host in var.hosts : host.name => host }
  config = {
    name       = each.value.name
    managed_by = each.value.managed_by != null ? each.value.managed_by : var.host_profiles[each.value.host_profile].managed_by
    location   = each.value.location != null ? each.value.location : var.host_profiles[each.value.host_profile].location
    labels     = each.value.labels != null ? each.value.labels : var.host_profiles[each.value.host_profile].labels
    selector   = each.value.identifier.id == null ? (each.value.identifier.name == null ? (each.value.identifier.mac_address == null ? (each.value.identifier.serial_number == null ? (each.value.identifier.host_chassis_id == null ? null : { host_selector_by_chassis_id = { chassis_id = each.value.identifier.host_chassis_id, chassis_id_subtype = each.value.identifier.host_chassis_id_subtype } }) : { module_selector_by_module_serial_number = { serial_number = each.value.identifier.serial_number } }) : { module_selector_by_module_mac = { module_mac = each.value.identifier.mac_address } }) : { module_selector_by_module_name = { module_name = each.value.identifier.name } }) : { module_selector_by_module_id = { module_id = each.value.identifier.id } }
  }
}




