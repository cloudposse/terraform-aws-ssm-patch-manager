locals {
  create_log_bucket       = local.enabled && var.bucket_id == null ? true : false
  bucket_id               = var.bucket_id != null ? var.bucket_id : module.ssm_patch_log_s3_bucket.bucket_id
  create_bucket_policy = var.ssm_bucket_policy != null ? 1 : 0
  bucket_policy = var.ssm_bucket_policy != null ? var.ssm_bucket_policy : data.aws_iam_policy_document.bucket_policy.*.json
}

data "aws_iam_policy_document" "bucket_policy" {
  count = local.create_bucket_policy

  statement {
    sid       = "AllowSSMPatchUpload"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:PutObjectAcl", "s3:GetEncryptionConfiguration"]
    resources = ["arn:${data.aws_partition.current.partition}:s3:::${join("", module.ssm_patch_log_s3_bucket.*.bucket_id)}/*"]

    principals {
      identifiers = ["*"]
      type        = "*"
    }
  }
}

resource "aws_s3_bucket_policy" "default" {
  count      = local.create_log_bucket ? 1 : 0
  bucket     = join("", module.ssm_patch_log_s3_bucket.*.bucket_id)
  policy     = local.bucket_policy
  depends_on = [module.ssm_patch_log_s3_bucket.*.bucket_id]
}


module "ssm_patch_log_s3_bucket" {
  count              = local.create_log_bucket ? 1 : 0
  source             = "cloudposse/s3-bucket/aws"
  version            = "0.38.0"
  acl                = "private"
  versioning_enabled = false
  policy             = aws_s3_bucket_policy.default.*.id
  context            = module.this.context
}
