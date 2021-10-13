data "aws_caller_identity" "account" {}

data "aws_region" "region" {}

data "aws_vpc" "vpc" {
  id       = var.vpc_id
}
