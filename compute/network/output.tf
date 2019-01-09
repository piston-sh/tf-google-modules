output "vpc_id" {
  value = "${google_compute_network.vpc.self_link}"
}

output "public_subnet_ids" {
  value = "${module.public_subnet.subnet_ids}"
}

output "private_subnet_ids" {
  value = "${module.private_subnet.subnet_ids}"
}
