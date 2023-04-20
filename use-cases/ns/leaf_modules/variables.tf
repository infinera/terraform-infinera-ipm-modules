variable networks {
  type = list(object({name= optional(string), id=optional(string)}))
  description = "List of constellation Network"
  default = [{name= "XR Network1", id = "abc", network_profile = "network_profile2"}]
}

variable leaf_modules {
  type = map(list(object({name: string, config_profile = optional(string), config: optional(object({traffic_mode: optional(string),fiber_connection_mode: optional(string), tx_power_target_per_dsc: optional(number)}))})))
  description = "Leaf modules for specified network name "
  default = {"XR Network1" = [{name = "PORT_MODE_LEAF1"}, {name = "PORT_MODE_LEAF2"}],
             "XR Network2" = [{name = "PORT_MODE_LEAF3"}, {name = "PORT_MODE_LEAF4"}]}
}