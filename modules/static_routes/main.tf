locals {
  google_subnets = [
    "35.190.247.0/24",
    "35.191.0.0/16",
    "64.233.160.0/19",
    "66.102.0.0/20",
    "66.249.80.0/20",
    "72.14.192.0/18",
    "74.125.0.0/16",
    "108.177.8.0/21",
    "108.177.96.0/19",
    "130.211.0.0/22",
    "172.217.0.0/19",
    "172.217.32.0/20",
    "172.217.128.0/19",
    "172.217.160.0/20",
    "172.217.192.0/19",
    "172.253.56.0/21",
    "172.253.112.0/20",
    "173.194.0.0/16",
    "209.85.128.0/17",
    "216.58.192.0/19",
    "216.239.32.0/19"
  ]
}

data "google_compute_instance_group" "fw-ig" {
  name = "ig-panfw-europe-west2-a"
  zone = "europe-west2-a"
}

resource "google_compute_route" "internet_route" {
  for_each               = toset(data.google_compute_instance_group.fw-ig.instances)
  name                   = "internet-default-${index(tolist(data.google_compute_instance_group.fw-ig.instances), each.key)}"
  dest_range             = "0.0.0.0/0"
  network                = var.network_name
  project                = var.project
  description            = var.internet_route_desc
  next_hop_instance      = each.key
  next_hop_instance_zone = "europe-west2-a"
  priority               = 900
  tags                   = ["europe-west2-internet-default"]
}




/**********************************************************
Private Google Access Routes  
***********************************************************/

resource "google_compute_route" "private_google_access_route" {
  for_each         = toset(local.google_subnets)
  name             = "private-google-access-${index(local.google_subnets, each.key)}"
  dest_range       = each.key
  network          = var.network_name
  project          = var.project
  next_hop_gateway = "default-internet-gateway"
}

