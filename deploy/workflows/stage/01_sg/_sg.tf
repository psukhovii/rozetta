module "sg" {
  source           = "../../../modules/sg"
  alb_sg_name      = local.alb_sg_name
  vpc_id           = data.aws_vpc.selected_vpc.id
  container_port   = var.container_port
  ecs_task_sg_name = local.ecs_sg_name
  lb_sg_rules      = var.lb_sg_rules != [] ? var.lb_sg_rules : local.lb_default_sg_rules
  ecs_sg_rules     = var.ecs_sg_rules != [] ? var.ecs_sg_rules : local.ecs_default_sg_rules
  tags             = {}
}

