resource "google_compute_network" "vpc" {
  name                    = "${var.name}"
  auto_create_subnetworks = false
}

module "public_subnet" {
  source = "../subnet"

  name        = "${var.name}-public"
  vpc_id      = "${google_compute_network.vpc.self_link}"
  cidr_blocks = "${var.public_subnet_cidrs}"
}

module "private_subnet" {
  source = "../subnet"

  name        = "${var.name}-private"
  vpc_id      = "${google_compute_network.vpc.self_link}"
  cidr_blocks = "${var.private_subnet_cidrs}"
}

resource "google_compute_firewall" "firewall" {
  name    = "${var.name}-firewall"
  network = "${google_compute_network.vpc.self_link}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.allowed_inbound_tcp_ports}"]
  }

  allow {
    protocol = "udp"
    ports    = ["${var.allowed_inbound_udp_ports}"]
  }

  source_ranges = ["${var.destination_cidr_block}"]
}
