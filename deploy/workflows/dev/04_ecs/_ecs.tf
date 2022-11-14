module "ecs" {
  source = "../../../modules/ecs"

  ecr_name                 = local.ecr_name
  ecs_cluster_name         = local.ecs_cluster_name
  ecs_execution_role_name  = local.ecs_execution_role_name
  ecs_service_name         = local.ecs_service_name
  ecs_task_role_name       = local.ecs_task_role_name
  ecs_task_definition_name = local.ecs_task_definition_name
  private_subnet_ids       = data.aws_subnets.private_subnets.ids
  security_group_ids       = data.aws_security_group.ecs.id
  alb_tg_group_arn         = data.aws_lb_target_group.alb_tg_group.arn
  service_desired_count    = var.service_desired_count
  container_cpu            = var.container_cpu
  container_memory         = var.container_memory
  container_port           = var.container_port
  environment              = var.environment
  task_def_environment     = local.task_def_environment
  kms_name                 = local.kms_name
  tags                     = local.common_tags
}
