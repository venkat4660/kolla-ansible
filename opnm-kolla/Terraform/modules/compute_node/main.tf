resource "openstack_compute_instance_v2" "compute_nodes" {
  name            = "${var.instance_name}${count.index +1}-CM"
  flavor_name     = var.flavor_compute_nodes
  key_pair        = var.keypair
  security_groups = [var.security_group]
  count = var.compute_node_count

  block_device {
    uuid  = var.image_id
    source_type = "image"
    volume_size = 40
    boot_index = 0
    volume_type = var.volume_type
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = var.internal_network
  }
  network {
    name = var.internal_api_network
  }
}

resource "openstack_networking_floatingip_v2" "compute_floating_ips" {
  pool  = var.floating_ip_network
  count = var.compute_node_count
}

resource "openstack_compute_floatingip_associate_v2" "compute_node_floating_ips" {
  count       = var.compute_node_count
  instance_id = element(openstack_compute_instance_v2.compute_nodes.*.id, count.index)
  floating_ip = element(openstack_networking_floatingip_v2.compute_floating_ips.*.address, count.index)
}
/*
data "openstack_networking_network_v2" "secondary_network" {
  name = var.internal_network
}
*/
resource "openstack_compute_interface_attach_v2" "attach_interface" {
  count       = var.compute_node_count
  instance_id = element(openstack_compute_instance_v2.compute_nodes.*.id, count.index)
  network_id  = var.extenal_network
}


