// Create VPC
resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  description                     = var.vpc_description
  auto_create_subnetworks         = "false"
  routing_mode                    = "REGIONAL"
  project                         = var.project
  delete_default_routes_on_create = false
}

# // Create Subnet
resource "google_compute_subnetwork" "subnet" {
  for_each                 = var.subnets
  name                     = each.key
  region                   = each.value.region
  ip_cidr_range            = each.value.range
  description              = each.value.description
  secondary_ip_range       = each.value.secondary_ip_range
  network                  = google_compute_network.vpc.self_link
  private_ip_google_access = true
  depends_on               = [google_compute_network.vpc]

}
