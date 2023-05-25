variable "enable_manual_ips" {
  description = "Flag to indicate if manual_ips is enabled"
  type        = bool
  default     = true
}

variable "routers" {
  type = map
}

variable "project" {
  type = string
}

variable "network" {
  type = string
}

variable "nat_ips" {
  description = "List of self_links of external IPs. Changing this forces a new NAT to be created."
  type        = list(string)
  default     = []
}