output "scan_maintenance_window_task_id" {
  description = "Maintenance window task ID"
  value       = module.ssm_patch_manager.scan_maintenance_window_task_id
}

output "ssm_patch_log_s3_bucket_id" {
  description = "SSM Patch Manager s3 log bucket ID"
  value       = module.ssm_patch_manager.ssm_patch_log_s3_bucket_id
}

output "ssm_patch_log_s3_bucket_arn" {
  description = "SSM Patch Manager s3 log bucket arn"
  value       = module.ssm_patch_manager.ssm_patch_log_s3_bucket_arn
}

output "scan_maintenance_window_task_id" {
  description = "SSM Patch Manager scan maintenance windows task ID"
  value       = module.ssm_patch_manager.scan_maintenance_window_task_id
}

output "install_maintenance_window_task_id" {
  description = "SSM Patch Manager install maintenance windows task ID"
  value       = module.ssm_patch_manager.install_maintenance_window_task_id
}

output "scan_maintenance_window_target_id" {
  description = "SSM Patch Manager scan maintenance window target_id"
  value       = module.ssm_patch_manager.scan_maintenance_window_target
}

output "install_maintenance_window_target_id" {
  description = "SSM Patch Manager install maintenance window target ID"
  value       = module.ssm_patch_manager.install_maintenance_window_target_id
}

output "install_maintenance_window_id" {
  description = "SSM Patch Manager install maintenance window ID"
  value       = module.ssm_patch_manager.install_maintenance_window
}

output "patch_baseline_arn" {
  description = "SSM Patch Manager patch baseline ARN"
  value       = module.ssm_patch_manager.patch_baseline_arn
}

output "install_patch_group_id" {
  description = "SSM Patch Manager install patch group ID"
  value       = module.ssm_patch_manager.install_patch_group_id
}

output "scan_patch_group_id" {
  description = "SSM Patch Manager scan patch group ID"
  value       = module.ssm_patch_manager.scan_patch_group_id
}
