output "storage_nodes_id" {
  value = openstack_compute_instance_v2.Storage_nodes.*.id
}

output "storage_node_floating_ips" {
  value = openstack_compute_floatingip_associate_v2.storage_node_floating_ips.*.floating_ip
}

output "storage_nodes_fixed_ips" {
  value = openstack_compute_instance_v2.Storage_nodes.*.access_ip_v4
}
