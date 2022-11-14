variable "alb_name" {}
variable "alb_tg_name" {}
variable "load_balancer_type" {}
variable "security_group_ids" {}
variable "public_subnet_ids" {}
variable "vpc_id" {}
variable "health_check_path" {}
variable "tsl_certificate_arn" {}
variable "kms_name" {}
variable "waf_enable" {}
variable "waf_web_acl_name" {}
variable "matcher" {
  default = "404"
}
variable "tags" {}