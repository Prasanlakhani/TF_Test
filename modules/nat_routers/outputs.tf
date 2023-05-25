output "cloudnat" {
  description = "nat gateways created"
  value       = google_compute_router_nat.nat
}

output "static_ip" {
  description = "static ip created"
  value       = google_compute_address.nat_static
}