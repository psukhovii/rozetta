locals {
  name_prefix              = "tf-${var.application_name}"
  environment_short_name   = "${var.environment}-${data.aws_region.current.name}"
  alb_name                 = "${local.name_prefix}-alb-${var.environment}"
  alb_sg_name              = "${local.name_prefix}-alb-sg-${local.environment_short_name}"
  alb_tg_name              = "${local.name_prefix}-alb-tg-${var.environment}"
  ecr_name                 = "${local.name_prefix}-${var.environment}"
  ecs_cluster_name         = "${local.name_prefix}-${var.environment}"
  ecs_service_name         = "${local.name_prefix}-ecs-service-${var.environment}"
  ecs_task_definition_name = "${local.name_prefix}-task-${var.environment}"
  ecs_execution_role_name  = "${local.name_prefix}-ecsTaskExecutionRole-${var.environment}"
  ecs_task_role_name       = "${local.name_prefix}-ecsTaskRole-${var.environment}"
  ecs_sg_name              = "${local.name_prefix}-ecs-sg-${local.environment_short_name}"
}