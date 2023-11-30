variable "mqtt_servers" {
  type = list(object({
                       identifier = object({module_name = optional(string), module_id = optional(string), module_serial_number = optional(string), module_mac_address = optional(string), server_id = optional(string)}),
                      server = optional(string), port = optional(number), kai = optional(number),
                      type = optional(string), sub_type = optional(number), enabled = optional(bool),
                      log_level = optional(number), region = optional(string)
                      }))
  description = "List of mqtt Servers"
  default = [
              { identifier = {module_name = "MA122232A001", server_id = "1"},
                server = "10.100.69.138", port = 31883, kai = 5,
                      type = "fault", sub_type = 65535, enabled = true,
                      log_level = 4, region = "1"
              },
              { identifier = {module_name = "MA222309A010", server_id = "1"},
                server = "10.100.69.138", port = 31883, kai = 5,
                      type = "fault", sub_type = 65535, enabled = true,
                      log_level = 4, region = "1"
              },
              { identifier = {module_name = "MA222324A004", server_id = "1"},
                server = "10.100.69.138", port = 31883, kai = 5,
                      type = "fault", sub_type = 65535, enabled = true,
                      log_level = 4, region = "2"
              },
            ]
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

variable "system_profile" {
  type = string
  default = ""
}

variable "user_profile" {
  type = string
   default = ""
}


