data "aws_region" "current" {}
data "aws_ecr_repository" "service" {
  name = var.ecr_name
}
data "aws_efs_file_system" "efs" {
  count = var.environment != "dev" ? 1 : 0
  tags = {
    Name = var.efs_name
  }
}