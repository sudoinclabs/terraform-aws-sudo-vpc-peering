

module "requester" {
  source = "./modules/requester"
  vpc_id = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  peer_account_id = local.peer_account_id
  peer_region   = local.peer_region
  dns_resolution = var.dns_resolution
}
module "accepter" {
  source = "./modules/accepter"
  vpc_connection_peering_id = module.requester.vpc_connection_peering_id
  dns_resolution = var.dns_resolution
}

/*resource "aws_vpc_peering_connection_options" "vpc_peering_options" {
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer_accepter.id

  requester {
    allow_remote_vpc_dns_resolution  = var.this_dns_resolution
    allow_classic_link_to_remote_vpc = var.this_link_to_peer_classic
    allow_vpc_to_remote_classic_link = var.this_link_to_local_classic
  }
}*/

/*resource "aws_route" "mgmt_dev_route" {
  route_table_id            = aws_route_table.mgmt_dev_route_table.id
  destination_cidr_block    = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt_dev.id
}*/