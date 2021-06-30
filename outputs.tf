output "ssm_patch_log_s3_bucket_id" {
  description = "SSM Patch manager s3 log bucket ID"
  value       = module.ssm_patch_log_s3_bucket[0].bucket_id
}

output "ssm_patch_log_s3_bucket_arn" {
  description = "SSM Patch Manager s3 log bucket ARN"
  value       = module.ssm_patch_log_s3_bucket[0].bucket_arn
}

output "scan_maintenance_window_task_id" {
  description = "SSM Patch Manager scan maintenance windows task ID"
  value       = aws_ssm_maintenance_window_task.task_scan_patches[0].id
}

output "install_maintenance_window_task_id" {
  description = "SSM Patch Manager install maintenance windows task ID"
  value       = aws_ssm_maintenance_window_task.task_install_patches[0].id
}

output "scan_maintenance_window_target" {
  description = "SSM Patch Manager scan maintenance window target"
  value       = aws_ssm_maintenance_window_target.target_scan[0].id
}

output "install_maintenance_window_target" {
  description = "SSM Patch Manager install maintenance window target id"
  value       = aws_ssm_maintenance_window_target.target_install[0].id
}

output "install_maintenance_window" {
  description = "SSM Patch Manager install maintenance window ID"
  value       = aws_ssm_maintenance_window.install_window[0].id
}

output "patch_baseline_arn" {
  description = "SSM Patch manager patch baseline arn"
  value       = aws_ssm_patch_baseline.baseline[0].arn
}

output "install_patch_group_id" {
  description = "SSM Patch manager install patch group id"
  value       = aws_ssm_patch_group.install_patchgroup[0].id
}

output "scan_patch_group_id" {
  description = "SSM Patch manager scan patch group id"
  value       = aws_ssm_patch_group.scan_patchgroup[0].id
}
