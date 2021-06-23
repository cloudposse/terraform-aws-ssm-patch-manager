output "ssm_patch_log_s3_bucket_id" {
  description = "SSM Patch manager s3 log bucket id"
  value = module.ssm_patch_log_s3_bucket.bucket_id
}

output "ssm_patch_log_s3_bucket_arn" {
  description = "SSM Patch manager s3 log bucket arn"
  value = module.ssm_patch_log_s3_bucket.bucket_arn
}

output "scan_maintenance_window_task_id" {
  description = "SSM Patch manager scan maintenance windows task id"
  value = aws_ssm_maintenance_window_task.task_scan_patches.id
}

output "install_maintenance_window_task_id" {
  description = "SSM Patch manager install maintenance windows task id"
  value = aws_ssm_maintenance_window_task.task_install_patches.id
}

output "scan_maintenance_window_target" {
  description = "SSM Patch manager scan maintenance window target"
  value = aws_ssm_maintenance_window_target.target_scan.id
}

output "install_maintenance_window_target" {
  description = "SSM Patch manager install maintenance window target id"
  value = aws_ssm_maintenance_window_target.target_install.id
}

output "install_maintenance_window" {
  description = "SSM Patch manager install maintenance window id"
  value = aws_ssm_maintenance_window.install_window.id
}

output "patch_baseline_arn" {
  description = "SSM Patch manager patch baseline arn"
  value = aws_ssm_patch_baseline.baseline.arn
}

output "install_patch_group_id" {
  description = "SSM Patch manager install patch group id"
  value = aws_ssm_patch_group.install_patchgroup.id
}

output "scan_patch_group_id" {
  description = "SSM Patch manager scan patch group id"
  value = aws_ssm_patch_group.scan_patchgroup.id
}
