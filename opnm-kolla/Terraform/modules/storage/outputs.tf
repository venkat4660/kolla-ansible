output "volume_id" {
    description = "ID of the volume"
    value = openstack_blockstorage_volume_v3.volumes.*.id
}