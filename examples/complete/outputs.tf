output "scan_maintenance_window_task_id" {
  description = "Maintenance window task ID"
  value       = module.ssm_patch_manager.scan_maintenance_window_task_id
}

output "ssm_patch_log_s3_bucket_id" {
  description = "SSM Patch manager s3 log bucket id"
  value       = module.ssm_patch_manager.ssm_patch_log_s3_bucket_id
}

output "ssm_patch_log_s3_bucket_arn" {
  description = "SSM Patch manager s3 log bucket arn"
  value       = module.ssm_patch_manager.ssm_patch_log_s3_bucket_arn
}

output "scan_maintenance_window_task_id" {
  description = "SSM Patch manager scan maintenance windows task id"
  value       = module.ssm_patch_manager.scan_maintenance_window_task_id
}

output "install_maintenance_window_task_id" {
  description = "SSM Patch manager install maintenance windows task id"
  value       = module.ssm_patch_manager.install_maintenance_window_task_id
}

output "scan_maintenance_window_target" {
  description = "SSM Patch manager scan maintenance window target"
  value       = module.ssm_patch_manager.scan_maintenance_window_target
}

output "install_maintenance_window_target" {
  description = "SSM Patch manager install maintenance window target id"
  value       = module.ssm_patch_manager.install_maintenance_window_target
}

output "install_maintenance_window" {
  description = "SSM Patch manager install maintenance window id"
  value       = module.ssm_patch_manager.install_maintenance_window
}

output "patch_baseline_arn" {
  description = "SSM Patch manager patch baseline arn"
  value       = module.ssm_patch_manager.patch_baseline_arn
}

output "install_patch_group_id" {
  description = "SSM Patch manager install patch group id"
  value       = module.ssm_patch_manager.install_patch_group_id
}

output "scan_patch_group_id" {
  description = "SSM Patch manager scan patch group id"
  value       = module.ssm_patch_manager.scan_patch_group_id
}
