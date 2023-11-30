variable "modules" {
  type = list(object({ identifier = object({module_name = optional(string), module_id = optional(string), serial_number = optional(string), mac_address = optional(string)}),
                        profile  = optional(string),
                        module_name = optional(string), m_vlan_mode = optional(string),  debug_port_access = optional(string),
                        labels = optional(map(string)) }))
  description = "modules for specified network name "
  default     = [{ identifier = {module_name = "Module 1" }, 
                    labels : { "region" : "South"}}, 
                  { identifier = {module_name = "Module 2"}, module_name : "AA" }]
}

variable "system_profile" {
  type = string
}

variable "user_profile" {
  type = string
}

variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type      = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}

