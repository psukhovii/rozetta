module "ecr" {
  source             = "../../../modules/efs"
  efs_name           = local.efs_name
  private_subnet_ids = data.aws_subnets.private_subnets.ids
  security_group     = data.aws_security_group.efs.id
  tags               = {}
}