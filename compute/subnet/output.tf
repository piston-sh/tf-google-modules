output "subnet_ids" {
  value = google_compute_subnetwork.subnet.*.self_link
}
