
variable "auto_accept_peering" {
  type = bool
  description = "(optional) Auto accept peering connection. Default: true"
  default = true
}
variable "tags" {
  type        = map(any)
  description = "(optional) map of tags to be assigned to hosted zone"
  default     = {}
}

variable "vpc_connection_peering_id" {
  type = string
  description = "Specify the vpc peering ID"
}

variable "dns_resolution" {
  type = bool
  description = "(optional) Enable DNS resolution for remote VPC"
  default = false
}