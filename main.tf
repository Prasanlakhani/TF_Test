terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.5"

    }
  }
}

provider "google" {
  project = "niravgcp4"
  #region  = var.region_name
}



terraform {
  backend "gcs" {
    bucket  = "niravgcp4-tf-state-prod"
    prefix  = "terraform/state"
  }
}

resource "google_compute_network" "mynetwork" {
name = "mynetwork"
project = "niravgcp4"
auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
name = "mynetwork-allow-http-ssh-rdp-icmp"
network = google_compute_network.mynetwork.self_link
allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
    }
allow {
    protocol = "icmp"
    }
source_ranges = ["0.0.0.0/0"]
}


#resource "google_compute_instance" "vm_instance" {
#  name         = "testvm1"
#  zone         = "europe-west1-d"
#  machine_type = "e2-micro"
#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-11"
#      }
#  }
#}


