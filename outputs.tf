output "eventbridge_bus_name" {
  value = local.final_bus_name
}

output "eventbridge_rules" {
  value = module.eventbridge.eventbridge_rules
}

output "eventbridge_targets" {
  value = module.eventbridge.eventbridge_targets
}

output "eventbridge_connections" {
  value     = module.eventbridge.eventbridge_connections
  sensitive = true
}

output "eventbridge_api_destinations" {
  value = module.eventbridge.eventbridge_api_destinations
}
