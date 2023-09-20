variable "keypair" {
    type = string
}
variable "security_group" {
    type = string
}
variable "instance_name" {
    type  = string
}
variable "volume_type" {
    type = string
}
variable "internal_network" {
    type = string
}
variable "flavor_Storage_nodes" {
    type = string
}
variable "Storage_node_count" {
    type = number
}
variable "image_id" {
  type = string
}

variable "floating_ip_network" {
  type = string
}
variable "internal_api_network" {
  type = string
}