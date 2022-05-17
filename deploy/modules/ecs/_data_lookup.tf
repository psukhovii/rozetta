data "aws_region" "current" {}
data "aws_ecr_repository" "service" {
  name = var.ecr_name
}