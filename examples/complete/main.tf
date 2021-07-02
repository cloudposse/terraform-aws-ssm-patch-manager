module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "0.25.0"

  cidr_block = "172.16.0.0/16"

  context = module.this.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "0.39.3"

  availability_zones = ["us-east-2a", "us-east-2b"]
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  cidr_block           = module.vpc.vpc_cidr_block
  nat_gateway_enabled  = false
  nat_instance_enabled = false

  context = module.this.context
}

# module "instance_profile_label" {
#   source  = "cloudposse/label/null"
#   version = "0.24.1"

#   attributes = distinct(compact(concat(module.this.attributes, ["profile"])))

#   context = module.this.context
# }

# data "aws_iam_policy_document" "test" {
#   statement {
#     effect = "Allow"

#     actions = [
#       "sts:AssumeRole"
#     ]

#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role" "test" {
#   name               = module.instance_profile_label.id
#   assume_role_policy = data.aws_iam_policy_document.test.json
#   tags               = module.instance_profile_label.tags
# }

# resource "aws_iam_instance_profile" "test" {
#   name = module.instance_profile_label.id
#   role = aws_iam_role.test.name
# }

module "ec2_instance" {
  source  = "cloudposse/ec2-instance/aws"
  version = "0.38.0"

  vpc_id                      = module.vpc.vpc_id
  subnet                      = module.subnets.private_subnet_ids[0]
  security_groups             = [module.vpc.vpc_default_security_group_id]
  #instance_profile            = aws_iam_instance_profile.test.name
  ami                         = "ami-cc7a52a9"
  ami_owner                   = "amazon"
  ssh_key_pair = ""

  # Enabling SSM Patch manager policy, access to the log bucket and the additional tags
  ssm_patch_manager_enabled       = true
  ssm_patch_manager_s3_log_bucket = format("%s-%s-%s-%s", module.this.namespace, module.this.environment, module.this.stage, module.this.name)

  tags = {
    "TOSCAN"    = "true",
    "TOINSTALL" = "true"
  }
  context = module.this.context
  depends_on = [module.ssm_patch_manager.ssm_patch_log_s3_bucket_id]
}

module "ssm_patch_manager" {
  source = "../.."
  region = var.region

  context = module.this.context
}