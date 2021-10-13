resource "aws_vpc_peering_connection_accepter" "vpc_peering_accepter" {
  vpc_peering_connection_id = var.vpc_connection_peering_id
  auto_accept               = var.auto_accept_peering
}

resource "aws_vpc_peering_connection_options" "vpc_peering_accepter_options" {

  #vpc_peering_connection_id = var.vpc_connection_peering_id
  vpc_peering_connection_id = time_sleep.peer_activation.triggers["vpc_peering_connection_id"]

  accepter {
    allow_remote_vpc_dns_resolution  = var.dns_resolution
  }

  depends_on = [aws_vpc_peering_connection_accepter.vpc_peering_accepter]
}

resource "time_sleep" "peer_activation" {
  create_duration = "60s"

  triggers = {
    # This sets up a proper dependency on the RAM association
    vpc_peering_connection_id = aws_vpc_peering_connection_accepter.vpc_peering_accepter.id
  }
}