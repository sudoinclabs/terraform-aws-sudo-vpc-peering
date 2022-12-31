variable "vpc_id" {
  type = string
  description = "Specify the VPC ID"
}

variable "peer_vpc_id" {
  type = string
  description = "Specify the VPC Peering ID"
}

variable "peer_account_id" {
  type = string
  description = "(optional) Speicfy the AWS account id for peering VPC"
  default = ""
}
variable "auto_accept" {
  type = bool
  description = "(optional) specify the auto accept. Default: true"
  default = true
}
variable "peer_region" {
  type = string
  description = "(optional) Speicfy the region peering VPC"
  default = ""
}

variable "tags" {
  type        = map(any)
  description = "(optional) map of tags to be assigned to hosted zone"
  default     = {}
}

variable "dns_resolution" {
  type = bool
  description = "(optional) Enable DNS resolution for remote VPC"
  default = false
}