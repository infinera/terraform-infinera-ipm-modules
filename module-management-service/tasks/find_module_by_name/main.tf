

data "ipm_modules" "modules" {
}

locals {
  found_module = [for module in data.ipm_modules.modules.modules : module if module.state.module_name == var.name]
}

output "found_module" {
  value = length(local.found_module) > 0 ? found_module[0] : null
}

variable name {
  type = string
  default = "A-LRN-Hub-Orlando"
}

