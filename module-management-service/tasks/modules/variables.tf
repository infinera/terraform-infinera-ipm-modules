variable "modules" {
  type = list(object({ identifier = object({module_name = optional(string), module_id = optional(string), module_serial_number = optional(string), module_mac_address = optional(string)}),
                        profile  = optional(string), module_name = optional(string), m_vlan_mode = optional(string),  debug_port_access = optional(string), labels = optional(map(string)) }))
  description = "modules for specified network name "
  default     = [{ identifier = {module_name = "Test_HUB1" }, 
                    labels : { "region" : "South"}}, 
                  { identifier = {module_name = "Test_LEAF1"}, debug_port_access : "enabled" }]
}

variable "module_profiles" {
  type        = map(object({ m_vlan_mode = optional(string),
                            debug_port_access = optional(string), 
                            labels = optional(map(string)) }))
  description = "Map of modules' profiles"
}

