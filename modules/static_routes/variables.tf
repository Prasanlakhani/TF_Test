variable "project" {
  type = string
}

variable "network_name" {
  type = string
}

variable "firewall_instances" {
  type    = list(string)
  default = null
}

variable "internet_route_desc" {
  type    = string
  default = null
}

# data "google_compute_instance_group" "all" {
#     name = "instance-group-name"
#     zone = "us-central1-a"
# }