locals {
  account_id        = join("", data.aws_caller_identity.current[*].account_id)
  aws_partition     = join("", data.aws_partition.current[*].partition)
  create_log_bucket = local.enabled && length(var.bucket_id) == 0
  bucket_id         = local.create_log_bucket ? module.this.id : var.bucket_id[0]
  bucket_policy     = var.ssm_bucket_policy != null ? var.ssm_bucket_policy : try(data.aws_iam_policy_document.bucket_policy[0].json, "")
}

data "aws_iam_policy_document" "bucket_policy" {
  count = local.create_log_bucket ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetEncryptionConfiguration",
    ]

    resources = [
      format("arn:%s:s3:::%s", local.aws_partition, module.this.id),
      format("arn:%s:s3:::%s/*", local.aws_partition, module.this.id)
    ]

    principals {
      identifiers = [format("arn:%s:iam::%s:root", local.aws_partition, local.account_id)]
      type        = "AWS"
    }
  }
}

module "ssm_patch_log_s3_bucket" {
  count   = local.create_log_bucket ? 1 : 0
  source  = "cloudposse/s3-bucket/aws"
  version = "4.0.1"

  acl                     = "private"
  versioning_enabled      = var.ssm_bucket_versioning_enable
  source_policy_documents = [local.bucket_policy]
  context                 = module.this.context
}
