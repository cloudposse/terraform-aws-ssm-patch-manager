variable "scan_maintenance_window_duration" {
  description = "The duration of the maintenence windows (hours)"
  type        = number
  default     = 3
}

variable "scan_maintenance_window_cutoff" {
  description = "The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution"
  type        = number
  default     = 1
}

variable "install_maintenance_window_duration" {
  description = "The duration of the maintenence windows (hours)"
  type        = number
  default     = 3
}

variable "install_maintenance_window_cutoff" {
  description = "The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution"
  type        = number
  default     = 1
}

variable "max_concurrency" {
  description = "The maximum number of targets this task can be run for in parallel"
  type        = number
  default     = 20
}

variable "max_errors" {
  description = "The maximum number of errors allowed before this task stops being scheduled"
  type        = number
  default     = 50
}

variable "service_role_arn" {
  description = "The role that should be assumed when executing the task. If a role is not provided, Systems Manager uses your account's service-linked role. If no service-linked role for Systems Manager exists in your account, it is created for you"
  type        = string
  default     = null
}

variable "reboot_option" {
  description = "When you choose the RebootIfNeeded option, the instance is rebooted if Patch Manager installed new patches, or if it detected any patches with a status of INSTALLED_PENDING_REBOOT during the Install operation. Possible values : RebootIfNeeded, NoReboot"
  type        = string
  default     = "RebootIfNeeded"
}

variable "notification_events" {
  description = "The different events for which you can receive notifications. Valid values: All, InProgress, Success, TimedOut, Cancelled, and Failed"
  type        = list(string)
  default     = ["All"]
}

variable "notification_type" {
  description = "When specified with Command, receive notification when the status of a command changes. When specified with Invocation, for commands sent to multiple instances, receive notification on a per-instance basis when the status of a command changes. Valid values: Command and Invocation"
  type        = string
  default     = "Command"
}

variable "notification_arn" {
  description = "An Amazon Resource Name (ARN) for a Simple Notification Service (SNS) topic. Run Command pushes notifications about command status changes to this topic."
  type        = string
  default     = ""
}

variable "sns_notification_role_arn" {
  description = "An Amazon Resource Name (ARN) for a Simple Notification Service (SNS) topic. Run Command pushes notifications about command status changes to this topic."
  type        = string
  default     = ""
}
variable "scan_patch_groups" {
  description = "The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)"
  type        = list(string)
  default     = ["TOSCAN"]
}

variable "scan_maintenance_window_schedule" {
  description = "The schedule of the Maintenance Window in the form of a cron or rate expression."
  type        = string
  default     = "cron(0 0 18 ? * WED *)"
}

variable "task_scan_priority" {
  description = "The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel. Default 1"
  type        = number
  default     = 1
}

variable "scan_sns_notification_enabled" {
  description = "Enable/Disable the SNS notification for scans"
  type        = bool
  default     = false
}

variable "scan_maintenance_windows_targets" {
  description = "The map of tags for targetting which EC2 instances will be scaned"
  type = list(object({
    key : string
    values : list(string)
    }
    )
  )
  default = []
}

variable "install_patch_groups" {
  description = "The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)"
  type        = list(string)
  default     = ["TOPATCH"]
}

variable "install_maintenance_window_schedule" {
  description = "The schedule of the Maintenance Window in the form of a cron or rate expression"
  type        = string
  default     = "cron(0 0 21 ? * WED *)"
}

variable "s3_bucket_prefix_install_logs" {
  description = "The Amazon S3 bucket subfolder"
  type        = string
  default     = "install"
}

variable "task_install_priority" {
  description = "The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel."
  type        = number
  default     = 1
}

variable "install_sns_notification_enabled" {
  description = "Enable/disable the SNS notification for install patches"
  type        = bool
  default     = false
}

variable "install_maintenance_windows_targets" {
  description = "The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)"
  type = list(object({
    key : string
    values : list(string)
    }
    )
  )
  default = []
}

variable "operating_system" {
  description = "Defines the operating system the patch baseline applies to. Supported operating systems include WINDOWS, AMAZON_LINUX, AMAZON_LINUX_2, SUSE, UBUNTU, CENTOS, and REDHAT_ENTERPRISE_LINUX. The Default value is WINDOWS."
  type        = string
  default     = "AMAZON_LINUX_2"
}

variable "approved_patches" {
  description = "A list of explicitly approved patches for the baseline"
  type        = list(string)
  default     = []
}

variable "rejected_patches" {
  description = "A list of rejected patches"
  type        = list(string)
  default     = []
}

variable "patch_baseline_approval_rules" {
  description = "A set of rules used to include patches in the baseline. Up to 10 approval rules can be specified. Each `approval_rule` block requires the fields documented below."
  type = list(object({
    approve_after_days : number
    compliance_level : string
    enable_non_security : bool
    patch_baseline_filters : list(object({
      name : string
      values : list(string)
    }))
  }))

  default = [
    {
      approve_after_days  = 7
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
          values = ["Critical", "Important", "Medium"]
        }
      ]
    }
  ]

}
variable "approved_patches_compliance_level" {
  type        = string
  description = "Defines the compliance level for approved patches. This means that if an approved patch is reported as missing, this is the severity of the compliance violation. Valid compliance levels include the following: CRITICAL, HIGH, MEDIUM, LOW, INFORMATIONAL, UNSPECIFIED. The default value is UNSPECIFIED."
  default     = "HIGH"
}

variable "ssm_bucket_policy" {
  type        = string
  description = "Custom bucket policy for the SSM log bucket"
  default     = null
}

variable "bucket_id" {
  type        = list(string)
  description = "The bucket ID to use for the patch log. If no bucket ID is provided, the module will create a new one. This is of type `list(string)` to work around #41 / https://github.com/hashicorp/terraform/issues/28962."
  default     = []
}

variable "ssm_bucket_versioning_enable" {
  type        = string
  description = "To enable or disable S3 bucket versioning for the log bucket."
  default     = true
}
