module "requester" {
  source = "../requester"
  vpc_id = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  peer_account_id = data.aws_caller_identity.accepter_account.account_id
  peer_region   = data.aws_region.accepter_region.name
  dns_resolution = var.dns_resolution
  providers = {
    aws = aws.requester
  }
}
module "accepter" {
  source = "../accepter"
  vpc_connection_peering_id = module.requester.vpc_connection_peering_id
  dns_resolution = var.dns_resolution
  providers = {
    aws = aws.accepter
  }
}

resource "aws_route" "requester_routes" {
  count                     = var.route_vpc ? length(data.aws_route_tables.requester_routes[0].ids) : 0
  route_table_id            = tolist(data.aws_route_tables.requester_routes[0].ids)[count.index]
  destination_cidr_block    = data.aws_vpc.accepter_vpc.cidr_block
  vpc_peering_connection_id = module.requester.vpc_connection_peering_id

  provider = aws.requester
}

resource "aws_route" "accepter_routes" {
  count                     = var.route_vpc ? length(data.aws_route_tables.accepter_routes[0].ids) : 0
  route_table_id            = tolist(data.aws_route_tables.accepter_routes[0].ids)[count.index]
  destination_cidr_block    = data.aws_vpc.vpc.cidr_block
  vpc_peering_connection_id = module.requester.vpc_connection_peering_id

  provider = aws.accepter
}
