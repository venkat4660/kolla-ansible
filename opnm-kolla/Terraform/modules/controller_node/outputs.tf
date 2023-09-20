output "controller_nodes_id" {
  value = openstack_compute_instance_v2.controller_nodes.*.id
}

output "controller_node_floating_ips" {
  value = openstack_compute_floatingip_associate_v2.controller_node_floating_ips.*.floating_ip
}

output "controller_nodes_fixed_ips" {
  value = openstack_compute_instance_v2.controller_nodes.*.access_ip_v4
}