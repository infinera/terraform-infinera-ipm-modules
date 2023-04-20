terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
}

// Constellation Network Resource supports CRUD functions
resource "ipm_network" "constellation_networks" {
  for_each = { for network in var.networks : network.name => network }
  config = {
    name                    = each.value.name
    constellation_frequency = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].constellation_frequency: each.value.config.constellation_frequency != null ? each.value.config.constellation_frequency : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].constellation_frequency
    modulation              = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].modulation : each.value.config.modulation != null ? each.value.config.modulation : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].modulation
    tc_mode              = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].tc_mode : each.value.config.tc_mode != null ? each.value.config.tc_mode : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].tc_mode
    managed_by              = each.value.config == null ? var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].managed_by : each.value.config.managed_by != null ? each.value.config.managed_by : var.network_config_profiles[var.network_profiles[each.value.network_profile].network_config_profile].managed_by
  }
  hub_module = {
    config = {
      selector = {
        module_selector_by_module_name = {
          module_name = each.value.hub_name
        }
      }
      module = {
        traffic_mode = each.value.hub_config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].traffic_mode : each.value.hub_config.traffic_mode != null ? each.value.hub_config.traffic_mode : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].traffic_mode
        fiber_connection_mode = each.value.hub_config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fiber_connection_mode : each.value.hub_config.fiber_connection_mode != null ? each.value.hub_config.fiber_connection_mode : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fiber_connection_mode
        planned_capacity          = each.value.hub_config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].planned_capacity : each.value.hub_config.planned_capacity != null ? each.value.hub_config.planned_capacity : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].planned_capacity
        requested_nominal_psd_offset = each.value.hub_config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].requested_nominal_psd_offset : each.value.hub_config.requested_nominal_psd_offset != null ? each.value.hub_config.requested_nominal_psd_offset : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].requested_nominal_psd_offset
        fec_iterations          = each.value.hub_config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fec_iterations : each.value.hub_config.fec_iterations != null ? each.value.hub_config.fec_iterations : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].fec_iterations
        tx_clp_target = each.value.hub_config == null ? var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].tx_clp_target : each.value.hub_config.tx_clp_target != null ? each.value.hub_config.tx_clp_target : var.module_config_profiles[var.network_profiles[each.value.network_profile].hub_config_profile].tx_clp_target
      }
    }
  }
}




