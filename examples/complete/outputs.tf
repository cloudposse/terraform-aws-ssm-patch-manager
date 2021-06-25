output "scan_maintenance_window_task_id" {
  description = "Maintenance window task ID"
  value       = module.ssm_patch_manager.scan_maintenance_window_task_id
}
