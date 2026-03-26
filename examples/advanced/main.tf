provider "aws" {
  region = "ap-south-1"
}

module "eventbridge" {
  source = "../../"

  bus_name   = "advanced-bus"
  create_bus = true

  create_api_destinations = true
  create_connections      = true

  connections = {
    example = {
      authorization_type = "API_KEY"
      auth_parameters = {
        api_key = {
          key   = "x-api-key"
          value = "dummy"
        }
      }
    }
  }

  api_destinations = {
    example = {
      invocation_endpoint = "https://example.com"
      http_method         = "POST"
    }
  }

  rules = {
    advanced = {
      description = "advanced rule"
      event_pattern = jsonencode({
        source = ["advanced.app"]
      })
    }
  }

  tags = {
    Env = "prod"
  }
}
