terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = ">= 3.50"
  }
  backend "s3" {
    bucket  = "terraform-state-storage2-eu-west-1"
    region  = "eu-west-1"
    key     = "rosetta-api/prod/ecs.tfstate"
    profile = "origyn-root"
  }
}
