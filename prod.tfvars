project      = "niravgcp4"
project_name = "niravgcp4"
#vpc_names       = "core_vpc"

core_vpc_description = "core vpc for project"
core_subnets = {
  europe-west2-10-250-18-0-24 = {
    region      = "europe-west2"
    range       = "10.250.18.0/24"
    description = "lod-dev gke nodes"
    secondary_ip_range = [
      {
        "ip_cidr_range" : "10.250.0.0/20",
        "range_name" : "lod-dev-gke-pods"
      },
      {
        "ip_cidr_range" : "10.250.16.0/23",
        "range_name" : "lod-dev-gke-services"
      }
    ]
  }
}


region = "europe-west2"

backend_bucket = "niravgcp4-tf-state-prod"
