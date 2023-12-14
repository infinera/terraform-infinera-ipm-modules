terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~> 0.4.0"
    }
  }
}

locals {
  ndus = { for ndu in var.ndus : ndu.identifier.ndu_name != null ? ndu.identifier.ndu_name : ndu.identifier.ndu_id != null ? ndu.identifier.ndu_id : ndu.identifier.ndu_serial_number != null ? ndu.identifier.ndu_serial_number : ndu.identifier.ndu_mac_address != null ? ndu.identifier.ndu_mac_address : "" => ndu }
}

data "ipm_ndus" "ndus" {
  for_each      = local.ndus
    name          = each.value.identifier.ndu_name != null ? each.value.identifier.ndu_name : null
    id            = each.value.identifier.ndu_id != null ? each.value.identifier.ndu_id : null
    serial_number = each.value.identifier.ndu_serial_number != null ? each.value.identifier.ndu_serial_number : null
    mac_address   = each.value.identifier.ndu_mac_address != null ? each.value.identifier.ndu_mac_address : null
}

resource "ipm_ndu" "ndus" {
  for_each = local.ndus
    identifier = {
      device_id = data.ipm_modules.modules[each.key].modules[0].id
    }
    config = {
      name          = each.value.ndu_name != null ? each.value.ndu_name : null
      location       = each.value.location != null ? each.value.location : each.value.profile != null ? var.ndu_profiles[each.value.profile].location : null
      clli       = each.value.clli != null ? each.value.clli : each.value.profile != null ? var.ndu_profiles[each.value.profile].clli : null
      contact = each.value.contact != null ? each.value.contact : each.value.profile != null ? var.ndu_profiles[each.value.profile].contact : null
      managedBy = each.value.managedBy != null ? each.value.managedBy : each.value.profile != null ? var.ndu_profiles[each.value.profile].managedBy : null
      polPowerCtrlMode = each.value.polPowerCtrlMode != null ? each.value.polPowerCtrlMode : each.value.profile != null ? var.ndu_profiles[each.value.profile].polPowerCtrlMode : null
      labels            = each.value.labels != null ? each.value.labels : each.value.profile != null ? var.ndu_profiles[each.value.profile].labels : null
    }
}