variable "region" {}
variable "network_name" {}

variable "tunnel_number" {
  default = 1
}

variable "source_bgp_asn" {}
variable "source_address" {}
variable "source_internal_address" {}
variable "source_internal_address_cidr" {}
variable "source_shared_secret" {}

variable "target_vpn_gateway" {}

variable "target_bgp_asn" {
  default = "64512"
}
