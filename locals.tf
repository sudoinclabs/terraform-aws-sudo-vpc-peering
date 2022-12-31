locals {
  # Peer account ID and region are optoinal for default use case.
  # If they are not specified we get it from data resource because our accepter module requires them
  peer_account_id = var.peer_account_id == "" ? data.aws_caller_identity.account.account_id : var.peer_account_id
  peer_region   = var.peer_region == "" ? data.aws_region.region.name : var.peer_region

}