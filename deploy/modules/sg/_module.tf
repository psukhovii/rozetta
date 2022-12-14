resource "aws_security_group" "alb" {
  name   = var.alb_sg_name
  vpc_id = var.vpc_id

  tags = merge({ Name = var.alb_sg_name }, var.tags)
}

resource "aws_security_group" "ecs_tasks" {
  name   = var.ecs_task_sg_name
  vpc_id = var.vpc_id

  tags = merge({ Name = var.ecs_task_sg_name }, var.tags)
}
resource "aws_security_group" "efs" {
  count  = var.environment != "dev" ? 1 : 0
  name   = var.efs_sg_name
  vpc_id = var.vpc_id

  tags = merge({ Name = var.efs_sg_name }, var.tags)
}
resource "aws_security_group_rule" "lb_rules" {
  count = length(var.lb_sg_rules)

  security_group_id = aws_security_group.alb.id
  type              = var.lb_sg_rules[count.index].type

  cidr_blocks = var.lb_sg_rules[count.index].cidr_blocks
  from_port   = var.lb_sg_rules[count.index].from_port
  to_port     = var.lb_sg_rules[count.index].to_port
  protocol    = var.lb_sg_rules[count.index].protocol
}

resource "aws_security_group_rule" "ecs_rules" {
  count = length(var.ecs_sg_rules)

  security_group_id = aws_security_group.ecs_tasks.id
  type              = var.ecs_sg_rules[count.index].type

  cidr_blocks = var.ecs_sg_rules[count.index].cidr_blocks
  from_port   = var.ecs_sg_rules[count.index].from_port
  to_port     = var.ecs_sg_rules[count.index].to_port
  protocol    = var.ecs_sg_rules[count.index].protocol
}

resource "aws_security_group_rule" "alb_rule1" {
  from_port                = var.container_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.ecs_tasks.id
  to_port                  = var.container_port
  type                     = "egress"
}
resource "aws_security_group_rule" "ecs_rule1" {
  from_port                = var.container_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ecs_tasks.id
  source_security_group_id = aws_security_group.alb.id
  to_port                  = var.container_port
  type                     = "ingress"
}
resource "aws_security_group_rule" "ecs_rule2" {
  count                    = var.environment != "dev" ? 1 : 0
  from_port                = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ecs_tasks.id
  source_security_group_id = aws_security_group.efs[0].id
  to_port                  = 2049
  type                     = "egress"
}
resource "aws_security_group_rule" "efs_rule1" {
  count                    = var.environment != "dev" ? 1 : 0
  from_port                = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs[0].id
  source_security_group_id = aws_security_group.ecs_tasks.id
  to_port                  = 2049
  type                     = "ingress"
}
resource "aws_security_group_rule" "efs_rule2" {
  count                    = var.environment != "dev" ? 1 : 0
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.efs[0].id
  source_security_group_id = aws_security_group.ecs_tasks.id
  to_port                  = 0
  type                     = "egress"
}