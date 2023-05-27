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

terraform {
  backend "gcs" {
    #bucket = var.backend_bucket
    prefix = "terraform/state"
  }
}



# ---------------------------------------------------------------------------------------------------------------------
# Create Core VPC
# ---------------------------------------------------------------------------------------------------------------------
module "core_vpc" {
  source  = "./modules/vpc-network"
  count   = 2
  project = var.project
  #vpc_name        = "core-vpc"
  vpc_name        = "vpc${count.index}"
  vpc_description = var.core_vpc_description
  subnets         = var.core_subnets
}


#Update




