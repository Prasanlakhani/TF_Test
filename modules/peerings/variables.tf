variable "enable_peering" {
  description = "self link of peered network"
  type        = bool
  default     = false
}

variable "peering_name" {
  description = "name of peering that will appear in console"
  type        = string
  default     = null
}

variable "vpc_network" {
  description = "self link of vpc network"
  type        = string
  default     = null
}

variable "peer_network" {
  description = "self link of peered network"
  type        = string
  default     = null
}

