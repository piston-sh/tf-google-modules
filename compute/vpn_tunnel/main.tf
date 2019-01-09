resource "google_compute_vpn_tunnel" "vpn_tunnel" {
  name          = "${var.network_name}-vpn-tunnel${var.tunnel_number}"
  peer_ip       = "${var.source_address}"
  shared_secret = "${var.source_shared_secret}"
  ike_version   = 1

  target_vpn_gateway = "${var.target_vpn_gateway}"

  router = "${google_compute_router.router.name}"
}

resource "google_compute_router" "router" {
  name    = "${var.network_name}-vpn-router${var.tunnel_number}"
  region  = "${var.region}"
  network = "${var.network_name}"

  bgp {
    asn = "${var.source_bgp_asn}"
  }
}

resource "google_compute_router_peer" "router_peer" {
  name            = "${var.network_name}-router-peer${var.tunnel_number}"
  router          = "${google_compute_router.router.name}"
  region          = "${google_compute_router.router.region}"
  peer_ip_address = "${var.source_internal_address}"
  peer_asn        = "${var.target_bgp_asn}"
  interface       = "${google_compute_router_interface.router_interface.name}"
}

resource "google_compute_router_interface" "router_interface" {
  name       = "${var.network_name}-router-interface${var.tunnel_number}"
  router     = "${google_compute_router.router.name}"
  region     = "${google_compute_router.router.region}"
  ip_range   = "${var.source_internal_address_cidr}"
  vpn_tunnel = "${google_compute_vpn_tunnel.vpn_tunnel.name}"
}
