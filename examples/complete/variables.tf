variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "patch_baseline_approval_rules" {
  description = "A set of rules used to include patches in the baseline. Up to 10 approval rules can be specified. Each `approval_rule` block requires the fields documented below."
  type        = any
  default = [
    {
      approve_until_date  = null
      approve_after_days  = "7"
      compliance_level    = "HIGH"
      enable_non_security = true
      patch_baseline_filters = [
        {
          name   = "PRODUCT"
          values = ["AmazonLinux2", "AmazonLinux2.0"]
        },
        {
          name   = "CLASSIFICATION"
          values = ["Security", "Bugfix", "Recommended"]
        },
        {
          name   = "SEVERITY"
          values = ["Critical", "Important"]
        }
      ]
    },
    {
      approve_until_date  = "2021-08-30"
      approve_after_days  = null
      compliance_level    = "HIGH"
      enable_non_security = false # should be false for windows operating system
      patch_baseline_filters = [
        {
          name   = "PRODUCT"
          values = ["WindowsServer2016", "WindowsServer2019", "WindowsServer2012R2", "WindowsServer2012"]
        },
        {
          name   = "CLASSIFICATION"
          values = ["CriticalUpdates", "SecurityUpdates", "UpdateRollups", "Updates"]
        }
      ]
    }
  ]
}