variable "project_name" {
  type = string
}

variable "project" {
  type = string
}

variable "backend_bucket" {
  type = string
}

#variable "vpc_names" {
#
#    type = string
#}

variable "core_vpc_description" {
  type = string
}

variable "core_subnets" {
  type = map(any)
}


variable "vpc_network" {
  description = "self link of vpc network"
  type        = string
  default     = null
}



variable "region" {
  type = string
}
