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
variable "flavor_Deployment_nodes" {
    type = string
}
variable "Deployment_node_count" {
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