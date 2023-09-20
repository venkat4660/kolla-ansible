resource "openstack_blockstorage_volume_v3" "volumes" {
  name         = "${var.volume_name}${count.index + 1}"
  size         = var.volume_size
  volume_type  = var.volume_type
  count        = var.volume_count
}
