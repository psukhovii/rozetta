module "ecr" {
  source   = "../../../modules/ecr"
  ecr_name = local.ecr_name
  tags     = {}
}