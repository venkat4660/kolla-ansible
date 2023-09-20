output "deployment_nodes_id" {
  value = module.deployment_node.deployment_nodes_id
}
output "deployment_node_floating_ips" {
  value = module.deployment_node.deployment_node_floating_ips
}

output "compute_nodes_id" {
  value = module.compute_nodes.compute_nodes_id
}
output "compute_node_floating_ips" {
  value = module.compute_nodes.compute_node_floating_ips
}

output "controller_nodes_id" {
  value = module.controller_nodes.controller_nodes_id
}
output "controller_node_floating_ips" {
  value = module.controller_nodes.controller_node_floating_ips
}

output "storage_nodes_id" {
  value = module.Storage_nodes.storage_nodes_id
}
output "storage_node_floating_ips" {
  value = module.Storage_nodes.storage_node_floating_ips
}