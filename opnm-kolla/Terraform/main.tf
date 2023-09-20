module "keypair" {
  source     = "./modules/keypair"
  keypair    = var.keypair
  #public_key = var.public_key
}

module "security_group" {
  source         = "./modules/security_group"
  security_group = var.security_group
}

module "storage" {
  source       = "./modules/storage"
  volume_count = var.volume_count
  volume_name  = var.volume_name
  volume_size  = var.volume_size
  volume_type  = var.volume_type
}

module "compute_nodes" {
  source               = "./modules/compute_node"
  instance_name        = var.instance_name
  flavor_compute_nodes = var.flavor_compute_nodes
  keypair              = var.keypair
  security_group       = var.security_group
  compute_node_count   = var.compute_node_count
  volume_type          = var.volume_type
  internal_network     = var.internal_network
  image_id             = var.image_id
  floating_ip_network  = var.floating_ip_network
  internal_api_network = var.internal_api_network
  extenal_network = var.extenal_network
}

module "controller_nodes" {
  source                  = "./modules/controller_node"
  instance_name           = var.instance_name
  flavor_controller_nodes = var.flavor_controller_nodes
  keypair                 = var.keypair
  security_group          = var.security_group
  controller_node_count   = var.controller_node_count
  volume_type             = var.volume_type
  internal_network        = var.internal_network
  image_id                = var.image_id
  floating_ip_network     = var.floating_ip_network
  internal_api_network = var.internal_api_network
  extenal_network = var.extenal_network
}

module "deployment_node" {
  source                  = "./modules/deployment_node"
  instance_name           = var.instance_name
  flavor_Deployment_nodes = var.flavor_Deployment_nodes
  keypair                 = var.keypair
  security_group          = var.security_group
  Deployment_node_count   = var.Deployment_node_count
  volume_type             = var.volume_type
  internal_network        = var.internal_network
  image_id                = var.image_id
  floating_ip_network     = var.floating_ip_network
  internal_api_network = var.internal_api_network
}

module "Storage_nodes" {
  source               = "./modules/storage_node"
  instance_name        = var.instance_name
  flavor_Storage_nodes = var.flavor_Storage_nodes
  keypair              = var.keypair
  security_group       = var.security_group
  Storage_node_count   = var.Storage_node_count
  volume_type          = var.volume_type
  internal_network     = var.internal_network
  image_id             = var.image_id
  floating_ip_network  = var.floating_ip_network
  internal_api_network = var.internal_api_network
}

resource "openstack_compute_volume_attach_v2" "volume_associations" {
  count       = var.volume_count
  instance_id = module.Storage_nodes.storage_nodes_id[0]
  volume_id   = module.storage.volume_id[count.index]
}


resource "local_file" "host_inventory" {
  filename = "../Ansible/inventory/hosts"
  content  = <<-EOT
  [deployment_nodes]
  ${join("\n", module.deployment_node.deployment_node_floating_ips)}

  [compute_nodes]
  ${join("\n", module.compute_nodes.compute_node_floating_ips)}

  [controller_nodes]
  ${join("\n", module.controller_nodes.controller_node_floating_ips)}

  [storage_nodes]
  ${join("\n", module.Storage_nodes.storage_node_floating_ips)}

  [all:vars]
  ansible_user="{{remote_user}}"
  ansible_ssh_common_args='-o StrictHostKeyChecking=no'
  EOT
}

resource "local_file" "host_variables" {
  filename = "../Ansible/inventory/group_vars/multinode.yml"
  content  = <<-EOT
  compute:
   - ${join("\n - ", module.compute_nodes.compute_nodes_fixed_ips)}

  control:
   - ${join("\n - ", module.controller_nodes.controller_nodes_fixed_ips)}

  storage:
   - ${join("\n - ", module.Storage_nodes.storage_nodes_fixed_ips)}
  EOT
}
