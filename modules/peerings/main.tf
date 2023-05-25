resource "google_compute_network_peering" "vpc_peering" {
  count        = var.enable_peering ? 1 : 0
  name         = var.peering_name
  network      = var.vpc_network
  peer_network = var.peer_network
}