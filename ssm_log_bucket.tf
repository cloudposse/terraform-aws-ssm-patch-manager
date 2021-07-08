locals {
  account_id        = data.aws_caller_identity.current.account_id
  create_log_bucket = local.enabled && var.bucket_id == null
  bucket_id         = var.bucket_id != null ? var.bucket_id : module.ssm_patch_log_s3_bucket_label.id
  bucket_policy     = var.ssm_bucket_policy != null ? var.ssm_bucket_policy : data.aws_iam_policy_document.bucket_policy[0].json
}


module "ssm_patch_log_s3_bucket_label" {
  source  = "cloudposse/label/null"
  version = "0.24.1"

  enabled    = local.create_log_bucket
  # attributes = ["scan-window"]
  context    = module.this.context
}
data "aws_iam_policy_document" "bucket_policy" {
  count   = local.create_log_bucket ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetEncryptionConfiguration",
    ]

    resources = [
      format("arn:aws:s3:::%s", module.ssm_patch_log_s3_bucket_label.id),
      format("arn:aws:s3:::%s/*", module.ssm_patch_log_s3_bucket_label.id)
    ]

    principals {
      identifiers = [format("arn:aws:iam::%s:root", local.account_id)]
      type        = "AWS"
    }
  }
}

module "ssm_patch_log_s3_bucket" {
  count   = local.create_log_bucket ? 1 : 0
  source  = "cloudposse/s3-bucket/aws"
  version = "0.38.0"

  acl                = "private"
  versioning_enabled = var.ssm_bucket_versioning_enable
  policy             = local.bucket_policy
  context            = module.ssm_patch_log_s3_bucket_label.context
}
