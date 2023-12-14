
data "ipm_leaf_modules" "leaf_modules" {
  network_id = var.network_id
}

output "leaf_modules" {
  value = data.ipm_leaf_modules.leaf_modules
}


