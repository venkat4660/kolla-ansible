resource "openstack_compute_keypair_v2" "multinode_keypair" {
  name = var.keypair
  public_key = file("~/.ssh/id_rsa.pub")
}