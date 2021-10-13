data "aws_caller_identity" "account" {
        provider = aws.requester
}

data "aws_region" "region" {
        provider = aws.requester
}

data "aws_vpc" "vpc" {
  id       = var.vpc_id
      provider = aws.requester
}
data "aws_caller_identity" "accepter_account" {
    provider = aws.accepter
}

data "aws_region" "accepter_region" {
    provider = aws.accepter
}

data "aws_vpc" "accepter_vpc" {
  id       = var.peer_vpc_id
  provider = aws.accepter
}

data "aws_route_tables" "requester_routes" {
  count                     = var.route_vpc ? 1 : 0
  vpc_id   = var.vpc_id
  provider = aws.requester
}

data "aws_route_tables" "accepter_routes" {
  count                     = var.route_vpc ? 1 : 0
  vpc_id   = var.peer_vpc_id
  provider = aws.accepter
}
