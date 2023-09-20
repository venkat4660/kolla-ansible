resource "openstack_compute_instance_v2" "deployment_node" {
  name            = "${var.instance_name}${count.index + 1}-DN"
  flavor_name     = var.flavor_Deployment_nodes
  key_pair        = var.keypair
  security_groups = [var.security_group]
  count = var.Deployment_node_count

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

resource "openstack_networking_floatingip_v2" "deployment_floating_ips" {
  pool  = var.floating_ip_network
  count = var.Deployment_node_count
}

resource "openstack_compute_floatingip_associate_v2" "deployment_node_floating_ips" {
  count       = var.Deployment_node_count
  instance_id = element(openstack_compute_instance_v2.deployment_node[*].id, count.index)
  floating_ip = element(openstack_networking_floatingip_v2.deployment_floating_ips[*].address, count.index)
}