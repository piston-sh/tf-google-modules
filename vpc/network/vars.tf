variable "name" {}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "private_subnet_cidrs" {
  type = "list"
}

variable "allowed_inbound_tcp_ports" {
  type    = "list"
  default = []
}

variable "allowed_inbound_udp_ports" {
  type    = "list"
  default = []
}

variable "destination_cidr_block" {
  default = "0.0.0.0/0"
}
