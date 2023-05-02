variable networks {
type = list(object({ name = optional(string),
                      network_profile = optional(string),
                      config = optional(object({ name = optional(string), constellation_frequency = optional(number), modulation = optional(string),
                                                managed_by = optional(string), tc_mode = optional(string) })),
                      hub_module = object({ identifier = object({name = string}),
                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string),
                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string), 
                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) })
                      leaf_modules = optional(list(object({ identifier = object({name = string}),
                                                            config_profile  = optional(string),
                                                            config = optional(object({ traffic_mode : optional(string), fiber_connection_mode : optional(string), 
                                                            managed_by : optional(string), planned_capacity : optional(string), requested_nominal_psd_offset : optional(string),
                                                            fec_iterations : optional(string), tx_clp_target : optional(string) })) }))) 
  }))
  description = "List of constellation Network"
  default = [{name= "XR Network1", 
             network_profile = "network_profile1", 
             hub_module = { identifier = {name = "PORT_MODE_HUB", config = {traffic_mode = "VTIMode"}}}, 
             leaf_modules=[{identifier = {name = "PORT_MODE_LEAF1"}},{identifier = {name = "PORT_MODE_LEAF2"}},{identifier = {name = "PORT_MODE_LEAF3"}}]}]
}

variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}