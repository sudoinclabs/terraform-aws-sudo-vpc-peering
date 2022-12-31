resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id

  peer_owner_id = var.peer_account_id
  peer_region   = var.peer_region
}


resource "aws_vpc_peering_connection_options" "vpc_peering_accepter_options" {

  #vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
vpc_peering_connection_id = time_sleep.peer_activation.triggers["vpc_peering_connection_id"]
  requester {
    allow_remote_vpc_dns_resolution  = var.dns_resolution
  }

}

resource "time_sleep" "peer_activation" {
  create_duration = "60s"

  triggers = {
    # This sets up a proper dependency on the RAM association
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
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