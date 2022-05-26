variable "ecs_cluster_name" {}
variable "ecs_service_name" {}
variable "ecs_task_role_name" {}
variable "ecs_execution_role_name" {}
variable "ecs_task_definition_name" {}
variable "efs_name" {
  default = ""
}
variable "security_group_ids" {}
variable "private_subnet_ids" {}
variable "ecr_name" {}
variable "container_port" {}
variable "container_cpu" {}
variable "container_memory" {}
variable "service_desired_count" {}
variable "alb_tg_group_arn" {}
variable "environment" {}
variable "tags" {}