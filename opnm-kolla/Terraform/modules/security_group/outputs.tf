output "security_group" {
  description = "ID of the security group"
  value = openstack_compute_secgroup_v2.security_group.name
}