output "deployment_nodes_id" {
  value = openstack_compute_instance_v2.deployment_node.*.id
}

output "deployment_node_floating_ips" {
  value = openstack_compute_floatingip_associate_v2.deployment_node_floating_ips.*.floating_ip
}

output "deployment_node_fixed_ips" {
  value = openstack_compute_instance_v2.deployment_node.*.access_ip_v4
}