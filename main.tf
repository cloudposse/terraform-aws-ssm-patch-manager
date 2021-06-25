locals {
  enabled                 = module.this.enabled
  create_log_bucket       = local.enabled && var.bucket_id == null ? true : false
  bucket_id               = var.bucket_id != "" ? var.bucket_id : module.ssm_patch_log_s3_bucket.bucket_id
  default_allowed_actions = ["s3:GetObject", "s3:PutObject", "s3:PutObjectAcl", "s3:GetEncryptionConfiguration"]
}

module "ssm_patch_log_s3_bucket" {
  count                  = local.create_log_bucket ? 1 : 0
  source                 = "cloudposse/s3-bucket/aws"
  version                = "0.38.0"
  acl                    = "private"
  versioning_enabled     = false
  allowed_bucket_actions = var.ssm_bucket_policy != null ? [] : local.default_allowed_actions
  policy                 = var.ssm_bucket_policy
  context                = module.this.context
}

resource "aws_ssm_maintenance_window" "scan_window" {
  count    = local.enabled ? 1 : 0
  name     = "${module.this.id}-scan-window"
  schedule = var.scan_maintenance_window_schedule
  duration = var.maintenance_window_duration
  cutoff   = var.maintenance_window_cutoff
}

resource "aws_ssm_maintenance_window_task" "task_scan_patches" {
  count            = module.this.enabled ? 1 : 0
  window_id        = aws_ssm_maintenance_window.scan_window[0].id
  task_type        = "RUN_COMMAND"
  task_arn         = "AWS-RunPatchBaseline"
  priority         = var.task_scan_priority
  service_role_arn = var.service_role_arn
  max_concurrency  = var.max_concurrency
  max_errors       = var.max_errors

  targets {
    key    = "WindowTargetIds"
    values = aws_ssm_maintenance_window_target.target_scan.*.id
  }

  task_invocation_parameters {
    run_command_parameters {
      parameter {
        name   = "Operation"
        values = ["Scan"]
      }
      parameter {
        name   = "RebootOption"
        values = ["NoReboot"]
      }
      output_s3_bucket     = local.bucket_id
      output_s3_key_prefix = "scaning"

      service_role_arn = var.role_arn_for_notification
      dynamic "notification_config" {
        for_each = var.enable_notification_scan ? [1] : []
        content {
          notification_arn    = var.notification_arn
          notification_events = var.notification_events
          notification_type   = var.notification_type
        }
      }
    }
  }
}

resource "aws_ssm_maintenance_window_target" "target_scan" {
  count         = module.this.enabled ? 1 : 0
  window_id     = aws_ssm_maintenance_window.scan_window[0].id
  resource_type = "INSTANCE"

  dynamic "targets" {
    for_each = length(var.scan_maintenance_windows_targets) > 0 ? var.scan_maintenance_windows_targets : []
    content {
      key    = targets.value.key
      values = targets.value.values
    }
  }
  dynamic "targets" {
    for_each = length(var.scan_maintenance_windows_targets) == 0 ? [1] : []
    content {
      key    = "tag:Patch Group"
      values = var.scan_patch_groups
    }
  }
}

# Maintenance Windows for patching

resource "aws_ssm_maintenance_window" "install_window" {
  count    = module.this.enabled ? 1 : 0
  name     = "${module.this.id}-install-window"
  schedule = var.install_maintenance_window_schedule
  duration = var.maintenance_window_duration
  cutoff   = var.maintenance_window_cutoff
}

resource "aws_ssm_maintenance_window_task" "task_install_patches" {
  count            = module.this.enabled ? 1 : 0
  window_id        = aws_ssm_maintenance_window.install_window[0].id
  task_type        = "RUN_COMMAND"
  task_arn         = "AWS-RunPatchBaseline"
  priority         = var.task_install_priority
  service_role_arn = var.service_role_arn
  max_concurrency  = var.max_concurrency
  max_errors       = var.max_errors

  targets {
    key    = "WindowTargetIds"
    values = aws_ssm_maintenance_window_target.target_install.*.id
  }

  task_invocation_parameters {
    run_command_parameters {
      parameter {
        name   = "Operation"
        values = ["Install"]
      }
      parameter {
        name   = "RebootOption"
        values = [var.reboot_option]
      }
      output_s3_bucket     = local.bucket_id
      output_s3_key_prefix = var.s3_bucket_prefix_install_logs

      service_role_arn = var.role_arn_for_notification
      dynamic "notification_config" {
        for_each = var.enable_notification_install ? [1] : []
        content {
          notification_arn    = var.notification_arn
          notification_events = var.notification_events
          notification_type   = var.notification_type
        }
      }
    }
  }
}

resource "aws_ssm_maintenance_window_target" "target_install" {
  count         = module.this.enabled ? 1 : 0
  window_id     = aws_ssm_maintenance_window.install_window[0].id
  resource_type = "INSTANCE"
  dynamic "targets" {
    for_each = length(var.install_maintenance_windows_targets) > 0 ? var.install_maintenance_windows_targets : []
    content {
      key    = targets.value.key
      values = targets.value.values
    }
  }

  dynamic "targets" {
    for_each = length(var.install_maintenance_windows_targets) == 0 ? [1] : []
    content {
      key    = "tag:Patch Group"
      values = var.install_patch_groups
    }
  }
}

# Patch Baselines
resource "aws_ssm_patch_baseline" "baseline" {
  count            = module.this.enabled ? 1 : 0
  name             = "${module.this.id}-${var.operating_system}"
  description      = "Amazon linux 2 baseline"
  operating_system = var.operating_system

  approved_patches                  = var.approved_patches
  rejected_patches                  = var.rejected_patches
  approved_patches_compliance_level = var.approved_patches_compliance_level

  dynamic "approval_rule" {
    for_each = var.patch_baseline_approval_rules
    content {

      approve_after_days  = approval_rule.value.approve_after_days
      compliance_level    = approval_rule.value.compliance_level
      enable_non_security = approval_rule.value.enable_non_security

      # https://docs.aws.amazon.com/cli/latest/reference/ssm/describe-patch-properties.html
      dynamic "patch_filter" {
        for_each = approval_rule.value.patch_baseline_filters

        content {
          key    = patch_filter.value.name
          values = patch_filter.value.values
        }
      }
    }
  }
  tags = var.tags
}

resource "aws_ssm_patch_group" "install_patchgroup" {
  count       = (module.this.enabled ? 1 : 0) * length(var.scan_patch_groups)
  baseline_id = aws_ssm_patch_baseline.baseline[0].id
  patch_group = element(var.install_patch_groups, count.index)
}

resource "aws_ssm_patch_group" "scan_patchgroup" {
  count       = (module.this.enabled ? 1 : 0) * length(var.scan_patch_groups)
  baseline_id = aws_ssm_patch_baseline.baseline[0].id
  patch_group = element(var.scan_patch_groups, count.index)
}
