##################################
# Core
##################################

variable "bus_name" {
  type        = string
  default     = "default"
  description = "EventBridge bus name"
}

variable "create_bus" {
  type        = bool
  default     = false
  description = "Create custom EventBridge bus"
}

##################################
# Feature Toggles
##################################

variable "create_rules" {
  type    = bool
  default = true
}
variable "create_targets" {
  type    = bool
  default = true
}
variable "create_archives" {
  type    = bool
  default = false
}
variable "create_permissions" {
  type    = bool
  default = false
}
variable "create_connections" {
  type    = bool
  default = false
}
variable "create_api_destinations" {
  type    = bool
  default = false
}
variable "create_pipes" {
  type    = bool
  default = false
}
variable "create_schedules" {
  type    = bool
  default = false
}
variable "create_schedule_groups" {
  type    = bool
  default = false
}

##################################
# Config
##################################

variable "rules" {
  type    = any
  default = {}
}
variable "targets" {
  type    = any
  default = {}
}
variable "archives" {
  type    = any
  default = {}
}
variable "permissions" {
  type    = any
  default = {}
}
variable "connections" {
  type    = any
  default = {}
}
variable "api_destinations" {
  type    = any
  default = {}
}
variable "pipes" {
  type    = any
  default = {}
}
variable "schedules" {
  type    = any
  default = {}
}
variable "schedule_groups" {
  type    = any
  default = {}
}

##################################
# IAM
##################################

variable "attach_lambda_policy" {
  type    = bool
  default = false
}
variable "attach_sqs_policy" {
  type    = bool
  default = false
}
variable "attach_sns_policy" {
  type    = bool
  default = false
}
variable "attach_sfn_policy" {
  type    = bool
  default = false
}

variable "lambda_target_arns" {
  type    = list(string)
  default = []
}
variable "sqs_target_arns" {
  type    = list(string)
  default = []
}
variable "sns_target_arns" {
  type    = list(string)
  default = []
}
variable "sfn_target_arns" {
  type    = list(string)
  default = []
}

##################################
# Tags
##################################

variable "tags" {
  type    = map(string)
  default = {}
}
