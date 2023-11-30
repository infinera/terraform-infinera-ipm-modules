
variable hub {
  type = string
  default = "A-LRN-Hub-Orlando"
}

variable hub_client_if_aid {
  type = string
  default = "XR-T1"
}

variable leaf {
  type = string
  default = "A-LRN-Leaf1-BR"
}

variable leaf_client_if_aid {
  type = string
  default = "XR-T1"
}

variable capacity {
  type = number
  default = 0 //100
}

variable capacity_mode {
  type = string
  default = "" //portMode
}

