output "compute_nodes_id" {
  value = openstack_compute_instance_v2.compute_nodes.*.id
}

output "compute_nodes_fixed_ips" {
  value = openstack_compute_instance_v2.compute_nodes.*.access_ip_v4
}

output "compute_node_floating_ips" {
  value = openstack_compute_floatingip_associate_v2.compute_node_floating_ips.*.floating_ip
}