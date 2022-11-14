data "aws_region" "current" {}
data "aws_kms_key" "key" {
  key_id = "alias/${var.kms_name}"
}
data "aws_ecr_repository" "service" {
  name  = var.ecr_name
}