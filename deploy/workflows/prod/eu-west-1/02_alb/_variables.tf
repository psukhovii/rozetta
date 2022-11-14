variable "health_check_path" {}
variable "load_balancer_type" {
  default = "application"
}
variable "tsl_certificate_arn" {}
variable "waf_enable" {
  default = false
}
variable "waf_web_acl_name" {
  default = ""
}