variable "container_port" {}
variable "lb_sg_rules" {
  default = []
}
variable "ecs_sg_rules" {
  default = []
}
variable "enableEfs" {}