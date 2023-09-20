provider "openstack" {
  auth_url    = "https://zephyr02cn.netcracker.com:5000/v3"
  domain_name = "netcracker.com"
  user_name   = "veko0623"
  password    = var.user_ps
}