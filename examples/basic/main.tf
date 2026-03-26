provider "aws" {
  region = "ap-south-1"
}

module "eventbridge" {
  source = "../../"

  bus_name   = "basic-bus"
  create_bus = true # ✅ REQUIRED

  rules = {
    sample = {
      description = "basic rule"
      event_pattern = jsonencode({
        source = ["my.app"]
      })
    }
  }

  targets = {
    sample = [
      {
        name = "cloudwatch"
        arn  = "arn:aws:logs:ap-south-1:123456789012:log-group:/aws/events/basic"
      }
    ]
  }

  tags = {
    Env = "dev"
  }
}
