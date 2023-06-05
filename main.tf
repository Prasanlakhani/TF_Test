/********************************************************************
Providers
********************************************************************/
#provider "google" {
#
# Locked to 3.19 because 3.20 broke dynamic blocks apparently.
#
#  version = ">= 4.5"
#  project = var.project
#}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.5"
      #project = var.project
    }
  }
}


#terraform {
#  backend "gcs" {
#    #bucket = var.backend_bucket
#    prefix = "terraform/state"
#  }
#}



#terraform {
#  backend "remote" {
#    # The name of your Terraform Cloud organization.
#    organization = "prasanlakhani"
#
#    # The name of the Terraform Cloud workspace to store Terraform state files in.
#    workspaces {
#      name = var.tf_workspace
#    }
#  }
#}

terraform {
  backend "gcs" {}
}

provider "google" {
  project = var.project
  #region  = var.region_name
  #credentials = var.GOOGLE_CREDENTIALS

}

resource "google_compute_network" "vpc_network" {
  #project = var.project
  name                    = var.vpc_name
  auto_create_subnetworks = true
}

resource "random_id" "random_count" {
  byte_length = 4
  #  upper       = false
}

resource "google_compute_instance" "instance_creation" {
  
  name         = "${var.instance_name}-${random_id.random_count.hex}"
  machine_type = var.machinetype
  zone         = var.vmzone

  boot_disk {
    initialize_params {
      image = var.imageid
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    #subnetwork = var.subnetwork_id
  }
}





