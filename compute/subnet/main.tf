resource "google_compute_subnetwork" "subnet" {
  count         = length(var.cidr_blocks)
  name          = "${var.name}-${replace(replace(element(var.cidr_blocks, count.index), ".", "-"), "/", "-")}"
  network       = var.vpc_id
  ip_cidr_range = var.cidr_blocks[count.index]
}
