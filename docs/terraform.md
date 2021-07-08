<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_install_window_label"></a> [install\_window\_label](#module\_install\_window\_label) | cloudposse/label/null | 0.24.1 |
| <a name="module_scan_window_label"></a> [scan\_window\_label](#module\_scan\_window\_label) | cloudposse/label/null | 0.24.1 |
| <a name="module_ssm_patch_log_s3_bucket"></a> [ssm\_patch\_log\_s3\_bucket](#module\_ssm\_patch\_log\_s3\_bucket) | cloudposse/s3-bucket/aws | 0.38.0 |
| <a name="module_ssm_patch_log_s3_bucket_label"></a> [ssm\_patch\_log\_s3\_bucket\_label](#module\_ssm\_patch\_log\_s3\_bucket\_label) | cloudposse/label/null | 0.24.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.24.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_maintenance_window.install_window](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window) | resource |
| [aws_ssm_maintenance_window.scan_window](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window) | resource |
| [aws_ssm_maintenance_window_target.target_install](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window_target) | resource |
| [aws_ssm_maintenance_window_target.target_scan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window_target) | resource |
| [aws_ssm_maintenance_window_task.task_install_patches](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window_task) | resource |
| [aws_ssm_maintenance_window_task.task_scan_patches](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window_task) | resource |
| [aws_ssm_patch_baseline.baseline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_baseline) | resource |
| [aws_ssm_patch_group.install_patchgroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_group) | resource |
| [aws_ssm_patch_group.scan_patchgroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_approved_patches"></a> [approved\_patches](#input\_approved\_patches) | A list of explicitly approved patches for the baseline | `list(string)` | `[]` | no |
| <a name="input_approved_patches_compliance_level"></a> [approved\_patches\_compliance\_level](#input\_approved\_patches\_compliance\_level) | Defines the compliance level for approved patches. This means that if an approved patch is reported as missing, this is the severity of the compliance violation. Valid compliance levels include the following: CRITICAL, HIGH, MEDIUM, LOW, INFORMATIONAL, UNSPECIFIED. The default value is UNSPECIFIED. | `string` | `"HIGH"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | The bucket ID to use for the patch log. If no bucket ID is provided, the module will create a new one. | `string` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_install_maintenance_window_cutoff"></a> [install\_maintenance\_window\_cutoff](#input\_install\_maintenance\_window\_cutoff) | The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution | `number` | `1` | no |
| <a name="input_install_maintenance_window_duration"></a> [install\_maintenance\_window\_duration](#input\_install\_maintenance\_window\_duration) | The duration of the maintenence windows (hours) | `number` | `3` | no |
| <a name="input_install_maintenance_window_schedule"></a> [install\_maintenance\_window\_schedule](#input\_install\_maintenance\_window\_schedule) | The schedule of the Maintenance Window in the form of a cron or rate expression | `string` | `"cron(0 0 21 ? * WED *)"` | no |
| <a name="input_install_maintenance_windows_targets"></a> [install\_maintenance\_windows\_targets](#input\_install\_maintenance\_windows\_targets) | The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html) | <pre>list(object({<br>    key : string<br>    values : list(string)<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_install_patch_groups"></a> [install\_patch\_groups](#input\_install\_patch\_groups) | The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html) | `list(string)` | <pre>[<br>  "TOPATCH"<br>]</pre> | no |
| <a name="input_install_sns_notification_enabled"></a> [install\_sns\_notification\_enabled](#input\_install\_sns\_notification\_enabled) | Enable/disable the SNS notification for install patches | `bool` | `false` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_max_concurrency"></a> [max\_concurrency](#input\_max\_concurrency) | The maximum number of targets this task can be run for in parallel | `number` | `20` | no |
| <a name="input_max_errors"></a> [max\_errors](#input\_max\_errors) | The maximum number of errors allowed before this task stops being scheduled | `number` | `50` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_notification_arn"></a> [notification\_arn](#input\_notification\_arn) | An Amazon Resource Name (ARN) for a Simple Notification Service (SNS) topic. Run Command pushes notifications about command status changes to this topic. | `string` | `""` | no |
| <a name="input_notification_events"></a> [notification\_events](#input\_notification\_events) | The different events for which you can receive notifications. Valid values: All, InProgress, Success, TimedOut, Cancelled, and Failed | `list(string)` | <pre>[<br>  "All"<br>]</pre> | no |
| <a name="input_notification_type"></a> [notification\_type](#input\_notification\_type) | When specified with Command, receive notification when the status of a command changes. When specified with Invocation, for commands sent to multiple instances, receive notification on a per-instance basis when the status of a command changes. Valid values: Command and Invocation | `string` | `"Command"` | no |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | Defines the operating system the patch baseline applies to. Supported operating systems include WINDOWS, AMAZON\_LINUX, AMAZON\_LINUX\_2, SUSE, UBUNTU, CENTOS, and REDHAT\_ENTERPRISE\_LINUX. The Default value is WINDOWS. | `string` | `"AMAZON_LINUX_2"` | no |
| <a name="input_patch_baseline_approval_rules"></a> [patch\_baseline\_approval\_rules](#input\_patch\_baseline\_approval\_rules) | A set of rules used to include patches in the baseline. Up to 10 approval rules can be specified. Each `approval_rule` block requires the fields documented below. | <pre>list(object({<br>    approve_after_days : number<br>    compliance_level : string<br>    enable_non_security : bool<br>    patch_baseline_filters : list(object({<br>      name : string<br>      values : list(string)<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "approve_after_days": 7,<br>    "compliance_level": "HIGH",<br>    "enable_non_security": true,<br>    "patch_baseline_filters": [<br>      {<br>        "name": "PRODUCT",<br>        "values": [<br>          "AmazonLinux2",<br>          "AmazonLinux2.0"<br>        ]<br>      },<br>      {<br>        "name": "CLASSIFICATION",<br>        "values": [<br>          "Security",<br>          "Bugfix",<br>          "Recommended"<br>        ]<br>      },<br>      {<br>        "name": "SEVERITY",<br>        "values": [<br>          "Critical",<br>          "Important",<br>          "Medium"<br>        ]<br>      }<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_reboot_option"></a> [reboot\_option](#input\_reboot\_option) | When you choose the RebootIfNeeded option, the instance is rebooted if Patch Manager installed new patches, or if it detected any patches with a status of INSTALLED\_PENDING\_REBOOT during the Install operation. Possible values : RebootIfNeeded, NoReboot | `string` | `"RebootIfNeeded"` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_rejected_patches"></a> [rejected\_patches](#input\_rejected\_patches) | A list of rejected patches | `list(string)` | `[]` | no |
| <a name="input_s3_bucket_prefix_install_logs"></a> [s3\_bucket\_prefix\_install\_logs](#input\_s3\_bucket\_prefix\_install\_logs) | The Amazon S3 bucket subfolder | `string` | `"install"` | no |
| <a name="input_scan_maintenance_window_cutoff"></a> [scan\_maintenance\_window\_cutoff](#input\_scan\_maintenance\_window\_cutoff) | The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution | `number` | `1` | no |
| <a name="input_scan_maintenance_window_duration"></a> [scan\_maintenance\_window\_duration](#input\_scan\_maintenance\_window\_duration) | The duration of the maintenence windows (hours) | `number` | `3` | no |
| <a name="input_scan_maintenance_window_schedule"></a> [scan\_maintenance\_window\_schedule](#input\_scan\_maintenance\_window\_schedule) | The schedule of the Maintenance Window in the form of a cron or rate expression. | `string` | `"cron(0 0 18 ? * WED *)"` | no |
| <a name="input_scan_maintenance_windows_targets"></a> [scan\_maintenance\_windows\_targets](#input\_scan\_maintenance\_windows\_targets) | The map of tags for targetting which EC2 instances will be scaned | <pre>list(object({<br>    key : string<br>    values : list(string)<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_scan_patch_groups"></a> [scan\_patch\_groups](#input\_scan\_patch\_groups) | The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html) | `list(string)` | <pre>[<br>  "TOSCAN"<br>]</pre> | no |
| <a name="input_scan_sns_notification_enabled"></a> [scan\_sns\_notification\_enabled](#input\_scan\_sns\_notification\_enabled) | Enable/Disable the SNS notification for scans | `bool` | `false` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | The role that should be assumed when executing the task. If a role is not provided, Systems Manager uses your account's service-linked role. If no service-linked role for Systems Manager exists in your account, it is created for you | `string` | `null` | no |
| <a name="input_sns_notification_role_arn"></a> [sns\_notification\_role\_arn](#input\_sns\_notification\_role\_arn) | An Amazon Resource Name (ARN) for a Simple Notification Service (SNS) topic. Run Command pushes notifications about command status changes to this topic. | `string` | `""` | no |
| <a name="input_ssm_bucket_policy"></a> [ssm\_bucket\_policy](#input\_ssm\_bucket\_policy) | Custom bucket policy for the SSM log bucket | `string` | `null` | no |
| <a name="input_ssm_bucket_versioning_enable"></a> [ssm\_bucket\_versioning\_enable](#input\_ssm\_bucket\_versioning\_enable) | To enable or disable S3 bucket versioning for the log bucket. | `string` | `true` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| <a name="input_task_install_priority"></a> [task\_install\_priority](#input\_task\_install\_priority) | The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel. | `number` | `1` | no |
| <a name="input_task_scan_priority"></a> [task\_scan\_priority](#input\_task\_scan\_priority) | The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel. Default 1 | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_install_maintenance_window_id"></a> [install\_maintenance\_window\_id](#output\_install\_maintenance\_window\_id) | SSM Patch Manager install maintenance window ID |
| <a name="output_install_maintenance_window_target_id"></a> [install\_maintenance\_window\_target\_id](#output\_install\_maintenance\_window\_target\_id) | SSM Patch Manager install maintenance window target ID |
| <a name="output_install_maintenance_window_task_id"></a> [install\_maintenance\_window\_task\_id](#output\_install\_maintenance\_window\_task\_id) | SSM Patch Manager install maintenance windows task ID |
| <a name="output_install_patch_group_id"></a> [install\_patch\_group\_id](#output\_install\_patch\_group\_id) | SSM Patch Manager install patch group ID |
| <a name="output_patch_baseline_arn"></a> [patch\_baseline\_arn](#output\_patch\_baseline\_arn) | SSM Patch Manager patch baseline ARN |
| <a name="output_scan_maintenance_window_target_id"></a> [scan\_maintenance\_window\_target\_id](#output\_scan\_maintenance\_window\_target\_id) | SSM Patch Manager scan maintenance window target ID |
| <a name="output_scan_maintenance_window_task_id"></a> [scan\_maintenance\_window\_task\_id](#output\_scan\_maintenance\_window\_task\_id) | SSM Patch Manager scan maintenance windows task ID |
| <a name="output_scan_patch_group_id"></a> [scan\_patch\_group\_id](#output\_scan\_patch\_group\_id) | SSM Patch Manager scan patch group ID |
| <a name="output_ssm_patch_log_s3_bucket_arn"></a> [ssm\_patch\_log\_s3\_bucket\_arn](#output\_ssm\_patch\_log\_s3\_bucket\_arn) | SSM Patch Manager s3 log bucket ARN |
| <a name="output_ssm_patch_log_s3_bucket_id"></a> [ssm\_patch\_log\_s3\_bucket\_id](#output\_ssm\_patch\_log\_s3\_bucket\_id) | SSM Patch Manager s3 log bucket ID |
<!-- markdownlint-restore -->
