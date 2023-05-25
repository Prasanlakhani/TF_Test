# // Create NAT Router

resource "google_compute_router" "nat_router" {
  provider = google
  for_each = var.routers
  name     = each.key
  project  = var.project
  region   = each.value.region
  network  = var.network
}

# // Create Cloud NAT Gateways

resource "google_compute_router_nat" "nat" {
  for_each                           = var.routers
  name                               = "${each.key}-cloudnat"
  router                             = each.key
  region                             = each.value.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.nat_static[each.key].self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  #
  # nat_ip_allocate_option - How external IPs should be allocated for this NAT. 
  # Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform,
  # or MANUAL_ONLY for only user-allocated NAT IP addresses.
  #
  # Note on logging :filter - (Required) Specifies the desired filtering of logs on this NAT. 
  # Valid values are: "ERRORS_ONLY", "TRANSLATIONS_ONLY", "ALL"
  #
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  depends_on = [google_compute_router.nat_router]
}

#// Static IP Addresses for Cloud NAT
#
# This is only needed if nat_ip_allocate_option is set to MANUAL ONLY

resource "google_compute_address" "nat_static" {
  for_each = var.routers
  name     = "nat-man-ip-${each.key}"
  region   = each.value.region
}
