
terraform {
  required_version = ">= 0.14.5"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.0"
      #configuration_aliases = [aws.requester, aws.accepter]
    }
  }
}

provider "aws" {
  alias="requester"
}
provider "aws" {
  alias="accepter"
}