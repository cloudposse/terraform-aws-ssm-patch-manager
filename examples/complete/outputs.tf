output "scan_maintenance_window_task_id" {
  description = "Maintenance window task id"
  value       = module.ssm_patch_manager.scan_maintenance_window_task_id
}
