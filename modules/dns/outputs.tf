output "dns_zone_id" {
  value = "${google_dns_managed_zone.private_dns_zone.id}"
}

output "dns_name_servers" {
  value = "${google_dns_managed_zone.private_dns_zone.name_servers}"
}
