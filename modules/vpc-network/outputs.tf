output "network" {
  description = "A reference (self_link) to the VPC network"
  value       = google_compute_network.vpc.self_link
}

output "subnet" {
  description = "subnets created"
  value       = google_compute_subnetwork.subnet
}

output "vpc_name" {
  description = "Name of VPC"
  value       = google_compute_network.vpc.name
}


