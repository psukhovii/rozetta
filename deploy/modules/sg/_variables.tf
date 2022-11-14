variable "environment" {}
variable "alb_sg_name" {}
variable "vpc_id" {}
variable "ecs_task_sg_name" {}
variable "enableEfs" {
  default = true
}
variable "efs_sg_name" {
  default = ""
}
variable "container_port" {}
variable "lb_sg_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
    description = string
  }))
}
variable "ecs_sg_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
    description = string
  }))
}
variable "tags" {}