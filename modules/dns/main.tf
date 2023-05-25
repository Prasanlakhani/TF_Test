
resource "google_dns_managed_zone" "private_dns_zone" {
  project     = var.project
  name        = var.name
  dns_name    = var.dns_name
  description = var.description

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.vpc
    }
  }
}
