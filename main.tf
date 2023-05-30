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
      project = var.project
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




