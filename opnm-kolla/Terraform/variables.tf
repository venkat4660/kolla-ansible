variable "keypair" {
  type    = string
  default = "opmn-kolla-key"
}

variable "security_group" {
  type    = string
  default = "opmn-sg"
}
variable "volume_count" {
  type    = number
  default = 3
}
variable "volume_name" {
  type    = string
  default = "opmn-kolla-storage"
}
variable "volume_size" {
  type    = number
  default = 20
}
variable "volume_type" {
  type    = string
  default = "ceph_veko0623"
}
variable "instance_name" {
  type    = string
  default = "opmn-kolla"
}
variable "flavor_Deployment_nodes" {
  type    = string
  default = "IaaS.Vcpu_2.ram_4.disk_0"
}
variable "flavor_compute_nodes" {
  type    = string
  default = "IaaS.Vcpu_2.ram_4.disk_0"
}
variable "flavor_Storage_nodes" {
  type    = string
  default = "IaaS.Vcpu_2.ram_4.disk_0"
}
variable "flavor_controller_nodes" {
  type    = string
  default = "IaaS.Vcpu_4.ram_8.disk_0"
}
variable "Deployment_node_count" {
  type    = number
  default = 1
}
variable "compute_node_count" {
  type    = number
  default = 2
}
variable "controller_node_count" {
  type    = number
  default = 2
}
variable "Storage_node_count" {
  type    = number
  default = 1
}
variable "internal_network" {
  type    = string
  default = "inner-net_VEKO0623"
}
variable "floating_ip_network" {
  type    = string
  default = "ext-net"
}
variable "image_id" {
  type    = string
  default = "b9decfae-85c4-4ce2-99ce-21c17a27fb12"
}

variable "internal_api_network" {
  type    = string
  default = "int_api-net"
}

variable "extenal_network" {
  type    = string
  default = "edd90d44-94f5-42fe-9087-4b217a51f230"
}

#variable "public_key" {}

variable "user_ps" {
  default = "ManuSai@6853"
}
