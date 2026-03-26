##################################
# Create EventBridge Bus (if needed)
##################################

locals {
  is_default_bus = var.bus_name == "default"
}

resource "aws_cloudwatch_event_bus" "this" {
  count = var.create_bus && !local.is_default_bus ? 1 : 0

  name = var.bus_name
  tags = var.tags
}

##################################
# Final Bus Name Resolution
##################################

locals {
  final_bus_name = local.is_default_bus ? "default" : (
    var.create_bus ? aws_cloudwatch_event_bus.this[0].name : var.bus_name
  )
}

##################################
# EventBridge Module
##################################

module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  # 🔥 CRITICAL FIX
  depends_on = [
    aws_cloudwatch_event_bus.this
  ]

  # ❗ NEVER let module create bus
  create_bus = false

  # Use resolved bus
  bus_name = local.final_bus_name

  # Feature toggles
  create_rules            = var.create_rules
  create_targets          = var.create_targets
  create_archives         = var.create_archives
  create_permissions      = var.create_permissions
  create_connections      = var.create_connections
  create_api_destinations = var.create_api_destinations
  create_pipes            = var.create_pipes
  create_schedules        = var.create_schedules
  create_schedule_groups  = var.create_schedule_groups

  # Config
  rules            = var.rules
  targets          = var.targets
  archives         = var.archives
  permissions      = var.permissions
  connections      = var.connections
  api_destinations = var.api_destinations
  pipes            = var.pipes
  schedules        = var.schedules
  schedule_groups  = var.schedule_groups

  # IAM
  attach_lambda_policy = var.attach_lambda_policy
  attach_sqs_policy    = var.attach_sqs_policy
  attach_sns_policy    = var.attach_sns_policy
  attach_sfn_policy    = var.attach_sfn_policy

  lambda_target_arns = var.lambda_target_arns
  sqs_target_arns    = var.sqs_target_arns
  sns_target_arns    = var.sns_target_arns
  sfn_target_arns    = var.sfn_target_arns

  tags = var.tags
}
