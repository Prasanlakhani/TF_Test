output "instance_group" {
  description = "firewall instance group"
  value       = data.google_compute_instance_group.fw-ig
}
