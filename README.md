# EventBridge Terraform Wrapper

This module is a wrapper around terraform-aws-modules/eventbridge.

## Features

- Supports EventBridge Bus, Rules, Targets
- Supports Pipes, Schedules, Archives
- Supports API Destinations & Connections
- Simplified interface

## Usage

### Basic

```hcl
module "eventbridge" {
  source = "../../"

  bus_name = "my-bus"

  rules = {
    test = {
      description   = "test rule"
      event_pattern = jsonencode({ source = ["app"] })
    }
  }
}
```
