output "keypair_name" {
  description = "ID of the Keypair"
  value = openstack_compute_keypair_v2.multinode_keypair.name
}