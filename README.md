

<!-- markdownlint-disable -->
<a href="https://cpco.io/homepage"><img src="https://github.com/cloudposse/terraform-aws-ssm-patch-manager/blob/main/.github/banner.png?raw=true" alt="Project Banner"/></a><br/>
    <p align="right">
<a href="https://github.com/cloudposse/terraform-aws-ssm-patch-manager/releases/latest"><img src="https://img.shields.io/github/release/cloudposse/terraform-aws-ssm-patch-manager.svg?style=for-the-badge" alt="Latest Release"/></a><a href="https://github.com/cloudposse/terraform-aws-ssm-patch-manager/commits"><img src="https://img.shields.io/github/last-commit/cloudposse/terraform-aws-ssm-patch-manager.svg?style=for-the-badge" alt="Last Updated"/></a><a href="https://slack.cloudposse.com"><img src="https://slack.cloudposse.com/for-the-badge.svg" alt="Slack Community"/></a></p>
<!-- markdownlint-restore -->

<!--




  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `cloudposse/build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **





-->

This module provisions AWS SSM Patch manager maintenance window tasks, targets, patch baselines and patch groups and a s3 bucket for storing patch task logs.


> [!TIP]
> #### 👽 Use Atmos with Terraform
> Cloud Posse uses [`atmos`](https://atmos.tools) to easily orchestrate multiple environments using Terraform. <br/>
> Works with [Github Actions](https://atmos.tools/integrations/github-actions/), [Atlantis](https://atmos.tools/integrations/atlantis), or [Spacelift](https://atmos.tools/integrations/spacelift).
>
> <details>
> <summary><strong>Watch demo of using Atmos with Terraform</strong></summary>
> <img src="https://github.com/cloudposse/atmos/blob/main/docs/demo.gif?raw=true"/><br/>
> <i>Example of running <a href="https://atmos.tools"><code>atmos</code></a> to manage infrastructure from our <a href="https://atmos.tools/quick-start/">Quick Start</a> tutorial.</i>
> </detalis>


## Introduction

## Acknowledgements
  This module was heavily inspired by @jparnaudeau module
  https://github.com/jparnaudeau/terraform-aws-ssm-patch-management




## Usage

For a complete example, see [examples/complete](examples/complete).

For automated tests of the complete example using [bats](https://github.com/bats-core/bats-core) and [Terratest](https://github.com/gruntwork-io/terratest)
(which tests and deploys the example on AWS), see [test](test).

```hcl
module "ssm_patch_manager" {
  source  = "cloudposse/ssm-patch-manager/aws"
  version = "xxxx"
  name = "test"
}
```

> [!IMPORTANT]
> In Cloud Posse's examples, we avoid pinning modules to specific versions to prevent discrepancies between the documentation
> and the latest released versions. However, for your own projects, we strongly advise pinning each module to the exact version
> you're using. This practice ensures the stability of your infrastructure. Additionally, we recommend implementing a systematic
> approach for updating versions to avoid unexpected changes.





## Examples

Here is an example of using this module:
- [`examples/complete`](https://github.com/cloudposse/terraform-aws-ssm-patch-manager/) - complete example of using this module




<!-- markdownlint-disable -->
## Makefile Targets
```text
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
<!-- markdownlint-restore -->
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_install_window_label"></a> [install\_window\_label](#module\_install\_window\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_scan_window_label"></a> [scan\_window\_label](#module\_scan\_window\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_ssm_patch_log_s3_bucket"></a> [ssm\_patch\_log\_s3\_bucket](#module\_ssm\_patch\_log\_s3\_bucket) | cloudposse/s3-bucket/aws | 4.0.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

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
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br/>This is for some rare cases where resources want additional configuration of tags<br/>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_approved_patches"></a> [approved\_patches](#input\_approved\_patches) | A list of explicitly approved patches for the baseline | `list(string)` | `[]` | no |
| <a name="input_approved_patches_compliance_level"></a> [approved\_patches\_compliance\_level](#input\_approved\_patches\_compliance\_level) | Defines the compliance level for approved patches. This means that if an approved patch is reported as missing, this is the severity of the compliance violation. Valid compliance levels include the following: CRITICAL, HIGH, MEDIUM, LOW, INFORMATIONAL, UNSPECIFIED. The default value is UNSPECIFIED. | `string` | `"HIGH"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br/>in the order they appear in the list. New attributes are appended to the<br/>end of the list. The elements of the list are joined by the `delimiter`<br/>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | The bucket ID to use for the patch log. If no bucket ID is provided, the module will create a new one. This is of type `list(string)` to work around #41 / https://github.com/hashicorp/terraform/issues/28962. | `list(string)` | `[]` | no |
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#input\_cloudwatch\_log\_group\_name) | The name of the CloudWatch log group where you want to send command output. If you don't specify a group name, Systems Manager automatically creates a log group for you. The log group uses the following naming format: aws/ssm/SystemsManagerDocumentName. | `string` | `null` | no |
| <a name="input_cloudwatch_log_output_enabled"></a> [cloudwatch\_log\_output\_enabled](#input\_cloudwatch\_log\_output\_enabled) | Enables Systems Manager to send command output to CloudWatch Logs. | `bool` | `false` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br/>See description of individual variables for details.<br/>Leave string and numeric variables as `null` to use default value.<br/>Individual variable settings (non-null) override settings in context object,<br/>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br/>  "additional_tag_map": {},<br/>  "attributes": [],<br/>  "delimiter": null,<br/>  "descriptor_formats": {},<br/>  "enabled": true,<br/>  "environment": null,<br/>  "id_length_limit": null,<br/>  "label_key_case": null,<br/>  "label_order": [],<br/>  "label_value_case": null,<br/>  "labels_as_tags": [<br/>    "unset"<br/>  ],<br/>  "name": null,<br/>  "namespace": null,<br/>  "regex_replace_chars": null,<br/>  "stage": null,<br/>  "tags": {},<br/>  "tenant": null<br/>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br/>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br/>Map of maps. Keys are names of descriptors. Values are maps of the form<br/>`{<br/>   format = string<br/>   labels = list(string)<br/>}`<br/>(Type is `any` so the map values can later be enhanced to provide additional options.)<br/>`format` is a Terraform format string to be passed to the `format()` function.<br/>`labels` is a list of labels, in order, to pass to `format()` function.<br/>Label values will be normalized before being passed to `format()` so they will be<br/>identical to how they appear in `id`.<br/>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br/>Set to `0` for unlimited length.<br/>Set to `null` for keep the existing setting, which defaults to `0`.<br/>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_install_maintenance_window_cutoff"></a> [install\_maintenance\_window\_cutoff](#input\_install\_maintenance\_window\_cutoff) | The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution | `number` | `1` | no |
| <a name="input_install_maintenance_window_duration"></a> [install\_maintenance\_window\_duration](#input\_install\_maintenance\_window\_duration) | The duration of the maintenence windows (hours) | `number` | `3` | no |
| <a name="input_install_maintenance_window_schedule"></a> [install\_maintenance\_window\_schedule](#input\_install\_maintenance\_window\_schedule) | The schedule of the Maintenance Window in the form of a cron or rate expression | `string` | `"cron(0 0 21 ? * WED *)"` | no |
| <a name="input_install_maintenance_windows_targets"></a> [install\_maintenance\_windows\_targets](#input\_install\_maintenance\_windows\_targets) | The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html) | <pre>list(object({<br/>    key : string<br/>    values : list(string)<br/>    }<br/>    )<br/>  )</pre> | `[]` | no |
| <a name="input_install_patch_groups"></a> [install\_patch\_groups](#input\_install\_patch\_groups) | The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html) | `list(string)` | <pre>[<br/>  "TOPATCH"<br/>]</pre> | no |
| <a name="input_install_sns_notification_enabled"></a> [install\_sns\_notification\_enabled](#input\_install\_sns\_notification\_enabled) | Enable/disable the SNS notification for install patches | `bool` | `false` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br/>Does not affect keys of tags passed in via the `tags` input.<br/>Possible values: `lower`, `title`, `upper`.<br/>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br/>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br/>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br/>set as tag values, and output by this module individually.<br/>Does not affect values of tags passed in via the `tags` input.<br/>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br/>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br/>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br/>Default is to include all labels.<br/>Tags with empty values will not be included in the `tags` output.<br/>Set to `[]` to suppress all generated tags.<br/>**Notes:**<br/>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br/>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br/>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br/>  "default"<br/>]</pre> | no |
| <a name="input_max_concurrency"></a> [max\_concurrency](#input\_max\_concurrency) | The maximum number of targets this task can be run for in parallel | `number` | `20` | no |
| <a name="input_max_errors"></a> [max\_errors](#input\_max\_errors) | The maximum number of errors allowed before this task stops being scheduled | `number` | `50` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br/>This is the only ID element not also included as a `tag`.<br/>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_notification_arn"></a> [notification\_arn](#input\_notification\_arn) | An Amazon Resource Name (ARN) for a Simple Notification Service (SNS) topic. Run Command pushes notifications about command status changes to this topic. | `string` | `""` | no |
| <a name="input_notification_events"></a> [notification\_events](#input\_notification\_events) | The different events for which you can receive notifications. Valid values: All, InProgress, Success, TimedOut, Cancelled, and Failed | `list(string)` | <pre>[<br/>  "All"<br/>]</pre> | no |
| <a name="input_notification_type"></a> [notification\_type](#input\_notification\_type) | When specified with Command, receive notification when the status of a command changes. When specified with Invocation, for commands sent to multiple instances, receive notification on a per-instance basis when the status of a command changes. Valid values: Command and Invocation | `string` | `"Command"` | no |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | Defines the operating system the patch baseline applies to. Supported operating systems include WINDOWS, AMAZON\_LINUX, AMAZON\_LINUX\_2, SUSE, UBUNTU, CENTOS, and REDHAT\_ENTERPRISE\_LINUX. The Default value is WINDOWS. | `string` | `"AMAZON_LINUX_2"` | no |
| <a name="input_patch_baseline_approval_rules"></a> [patch\_baseline\_approval\_rules](#input\_patch\_baseline\_approval\_rules) | A set of rules used to include patches in the baseline. Up to 10 approval rules can be specified.<br/>    Each `approval_rule` block requires the fields documented below (unless marked optional).<br/>    `approve_after_days` and `approve_until_date` conflict, do not set both in the same `approval_rule`.<br/><br/>    See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_baseline#approval_rule-block for full details. | <pre>list(object({<br/>    approve_after_days : optional(number)<br/>    approve_until_date : optional(string)<br/>    compliance_level : string<br/>    enable_non_security : bool<br/>    patch_baseline_filters : list(object({<br/>      name : string<br/>      values : list(string)<br/>    }))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "approve_after_days": 7,<br/>    "compliance_level": "HIGH",<br/>    "enable_non_security": true,<br/>    "patch_baseline_filters": [<br/>      {<br/>        "name": "PRODUCT",<br/>        "values": [<br/>          "AmazonLinux2",<br/>          "AmazonLinux2.0"<br/>        ]<br/>      },<br/>      {<br/>        "name": "CLASSIFICATION",<br/>        "values": [<br/>          "Security",<br/>          "Bugfix",<br/>          "Recommended"<br/>        ]<br/>      },<br/>      {<br/>        "name": "SEVERITY",<br/>        "values": [<br/>          "Critical",<br/>          "Important",<br/>          "Medium"<br/>        ]<br/>      }<br/>    ]<br/>  }<br/>]</pre> | no |
| <a name="input_reboot_option"></a> [reboot\_option](#input\_reboot\_option) | When you choose the RebootIfNeeded option, the instance is rebooted if Patch Manager installed new patches, or if it detected any patches with a status of INSTALLED\_PENDING\_REBOOT during the Install operation. Possible values : RebootIfNeeded, NoReboot | `string` | `"RebootIfNeeded"` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br/>Characters matching the regex will be removed from the ID elements.<br/>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_rejected_patches"></a> [rejected\_patches](#input\_rejected\_patches) | A list of rejected patches | `list(string)` | `[]` | no |
| <a name="input_s3_bucket_prefix_install_logs"></a> [s3\_bucket\_prefix\_install\_logs](#input\_s3\_bucket\_prefix\_install\_logs) | The Amazon S3 bucket subfolder for install logs | `string` | `"install"` | no |
| <a name="input_s3_bucket_prefix_scan_logs"></a> [s3\_bucket\_prefix\_scan\_logs](#input\_s3\_bucket\_prefix\_scan\_logs) | The Amazon S3 bucket subfolder for scan logs | `string` | `"scanning"` | no |
| <a name="input_s3_log_output_enabled"></a> [s3\_log\_output\_enabled](#input\_s3\_log\_output\_enabled) | To enable or disable s3 bucket output for the runCommand logs | `bool` | `true` | no |
| <a name="input_scan_maintenance_window_cutoff"></a> [scan\_maintenance\_window\_cutoff](#input\_scan\_maintenance\_window\_cutoff) | The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution | `number` | `1` | no |
| <a name="input_scan_maintenance_window_duration"></a> [scan\_maintenance\_window\_duration](#input\_scan\_maintenance\_window\_duration) | The duration of the maintenence windows (hours) | `number` | `3` | no |
| <a name="input_scan_maintenance_window_schedule"></a> [scan\_maintenance\_window\_schedule](#input\_scan\_maintenance\_window\_schedule) | The schedule of the Maintenance Window in the form of a cron or rate expression. | `string` | `"cron(0 0 18 ? * WED *)"` | no |
| <a name="input_scan_maintenance_windows_targets"></a> [scan\_maintenance\_windows\_targets](#input\_scan\_maintenance\_windows\_targets) | The map of tags for targetting which EC2 instances will be scaned | <pre>list(object({<br/>    key : string<br/>    values : list(string)<br/>    }<br/>    )<br/>  )</pre> | `[]` | no |
| <a name="input_scan_patch_groups"></a> [scan\_patch\_groups](#input\_scan\_patch\_groups) | The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs. You can specify targets using instance IDs, resource group names, or tags that have been applied to instances. For more information about these examples formats see (https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html) | `list(string)` | <pre>[<br/>  "TOSCAN"<br/>]</pre> | no |
| <a name="input_scan_sns_notification_enabled"></a> [scan\_sns\_notification\_enabled](#input\_scan\_sns\_notification\_enabled) | Enable/Disable the SNS notification for scans | `bool` | `false` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | The role that should be assumed when executing the task. If a role is not provided, Systems Manager uses your account's service-linked role. If no service-linked role for Systems Manager exists in your account, it is created for you | `string` | `null` | no |
| <a name="input_sns_notification_role_arn"></a> [sns\_notification\_role\_arn](#input\_sns\_notification\_role\_arn) | An Amazon Resource Name (ARN) for a Simple Notification Service (SNS) topic. Run Command pushes notifications about command status changes to this topic. | `string` | `""` | no |
| <a name="input_ssm_bucket_policy"></a> [ssm\_bucket\_policy](#input\_ssm\_bucket\_policy) | Custom bucket policy for the SSM log bucket | `string` | `null` | no |
| <a name="input_ssm_bucket_versioning_enable"></a> [ssm\_bucket\_versioning\_enable](#input\_ssm\_bucket\_versioning\_enable) | To enable or disable S3 bucket versioning for the log bucket. | `string` | `true` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br/>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_task_install_priority"></a> [task\_install\_priority](#input\_task\_install\_priority) | The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel. | `number` | `1` | no |
| <a name="input_task_scan_priority"></a> [task\_scan\_priority](#input\_task\_scan\_priority) | The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel. Default 1 | `number` | `1` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |

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


## Related Projects

Check out these related projects.

- [terraform-null-label](https://github.com/cloudposse/terraform-null-label) - Terraform module designed to generate consistent names and tags for resources. Use terraform-null-label to implement a strict naming convention.


## References

For additional context, refer to some of these links.

- [Terraform Standard Module Structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure) - HashiCorp's standard module structure is a file and directory layout we recommend for reusable modules distributed in separate repositories.
- [Terraform Module Requirements](https://www.terraform.io/docs/registry/modules/publish.html#requirements) - HashiCorp's guidance on all the requirements for publishing a module. Meeting the requirements for publishing a module is extremely easy.
- [Terraform `random_integer` Resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) - The resource random_integer generates random values from a given range, described by the min and max attributes of a given resource.
- [Terraform Version Pinning](https://www.terraform.io/docs/configuration/terraform.html#specifying-a-required-terraform-version) - The required_version setting can be used to constrain which versions of the Terraform CLI can be used with your configuration



> [!TIP]
> #### Use Terraform Reference Architectures for AWS
>
> Use Cloud Posse's ready-to-go [terraform architecture blueprints](https://cloudposse.com/reference-architecture/) for AWS to get up and running quickly.
>
> ✅ We build it together with your team.<br/>
> ✅ Your team owns everything.<br/>
> ✅ 100% Open Source and backed by fanatical support.<br/>
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
> <details><summary>📚 <strong>Learn More</strong></summary>
>
> <br/>
>
> Cloud Posse is the leading [**DevOps Accelerator**](https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=commercial_support) for funded startups and enterprises.
>
> *Your team can operate like a pro today.*
>
> Ensure that your team succeeds by using Cloud Posse's proven process and turnkey blueprints. Plus, we stick around until you succeed.
> #### Day-0:  Your Foundation for Success
> - **Reference Architecture.** You'll get everything you need from the ground up built using 100% infrastructure as code.
> - **Deployment Strategy.** Adopt a proven deployment strategy with GitHub Actions, enabling automated, repeatable, and reliable software releases.
> - **Site Reliability Engineering.** Gain total visibility into your applications and services with Datadog, ensuring high availability and performance.
> - **Security Baseline.** Establish a secure environment from the start, with built-in governance, accountability, and comprehensive audit logs, safeguarding your operations.
> - **GitOps.** Empower your team to manage infrastructure changes confidently and efficiently through Pull Requests, leveraging the full power of GitHub Actions.
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
>
> #### Day-2: Your Operational Mastery
> - **Training.** Equip your team with the knowledge and skills to confidently manage the infrastructure, ensuring long-term success and self-sufficiency.
> - **Support.** Benefit from a seamless communication over Slack with our experts, ensuring you have the support you need, whenever you need it.
> - **Troubleshooting.** Access expert assistance to quickly resolve any operational challenges, minimizing downtime and maintaining business continuity.
> - **Code Reviews.** Enhance your team’s code quality with our expert feedback, fostering continuous improvement and collaboration.
> - **Bug Fixes.** Rely on our team to troubleshoot and resolve any issues, ensuring your systems run smoothly.
> - **Migration Assistance.** Accelerate your migration process with our dedicated support, minimizing disruption and speeding up time-to-value.
> - **Customer Workshops.** Engage with our team in weekly workshops, gaining insights and strategies to continuously improve and innovate.
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
> </details>

## ✨ Contributing

This project is under active development, and we encourage contributions from our community.



Many thanks to our outstanding contributors:

<a href="https://github.com/cloudposse/terraform-aws-ssm-patch-manager/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudposse/terraform-aws-ssm-patch-manager&max=24" />
</a>

For 🐛 bug reports & feature requests, please use the [issue tracker](https://github.com/cloudposse/terraform-aws-ssm-patch-manager/issues).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.
 1. Review our [Code of Conduct](https://github.com/cloudposse/terraform-aws-ssm-patch-manager/?tab=coc-ov-file#code-of-conduct) and [Contributor Guidelines](https://github.com/cloudposse/.github/blob/main/CONTRIBUTING.md).
 2. **Fork** the repo on GitHub
 3. **Clone** the project to your own machine
 4. **Commit** changes to your own branch
 5. **Push** your work back up to your fork
 6. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!

### 🌎 Slack Community

Join our [Open Source Community](https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=slack) on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

### 📰 Newsletter

Sign up for [our newsletter](https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=newsletter) and join 3,000+ DevOps engineers, CTOs, and founders who get insider access to the latest DevOps trends, so you can always stay in the know.
Dropped straight into your Inbox every week — and usually a 5-minute read.

### 📆 Office Hours <a href="https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=office_hours"><img src="https://img.cloudposse.com/fit-in/200x200/https://cloudposse.com/wp-content/uploads/2019/08/Powered-by-Zoom.png" align="right" /></a>

[Join us every Wednesday via Zoom](https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=office_hours) for your weekly dose of insider DevOps trends, AWS news and Terraform insights, all sourced from our SweetOps community, plus a _live Q&A_ that you can’t find anywhere else.
It's **FREE** for everyone!
## License

<a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge" alt="License"></a>

<details>
<summary>Preamble to the Apache License, Version 2.0</summary>
<br/>
<br/>

Complete license is available in the [`LICENSE`](LICENSE) file.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```
</details>

## Trademarks

All other trademarks referenced herein are the property of their respective owners.


## Copyrights

Copyright © 2021-2024 [Cloud Posse, LLC](https://cloudposse.com)



<a href="https://cloudposse.com/readme/footer/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-patch-manager&utm_content=readme_footer_link"><img alt="README footer" src="https://cloudposse.com/readme/footer/img"/></a>

<img alt="Beacon" width="0" src="https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/terraform-aws-ssm-patch-manager?pixel&cs=github&cm=readme&an=terraform-aws-ssm-patch-manager"/>
