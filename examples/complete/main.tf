module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "0.25.0"

  cidr_block = "172.16.0.0/16"

  context = module.this.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "0.39.3"

  availability_zones   = ["us-east-2a", "us-east-2b"]
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  cidr_block           = module.vpc.vpc_cidr_block
  nat_gateway_enabled  = true
  nat_instance_enabled = false

  context = module.this.context
}

module "ec2_instance" {
  source  = "cloudposse/ec2-instance/aws"
  version = "0.38.0"

  vpc_id          = module.vpc.vpc_id
  subnet          = module.subnets.private_subnet_ids[0]
  security_groups = [module.vpc.vpc_default_security_group_id]
  ami          = "ami-009b28ad8707b9ee8"
  ami_owner    = "amazon"
  ssh_key_pair = ""

  # Enabling SSM Patch manager policy, access to the log bucket and the additional tags
  ssm_patch_manager_enabled       = true
  ssm_patch_manager_s3_log_bucket = format("%s-%s-%s-%s", module.this.namespace, module.this.environment, module.this.stage, module.this.name)

  tags = {
    "TOSCAN"    = "true",
    "TOPATCH" = "true"
  }
  context    = module.this.context

}

module "ssm_patch_manager" {
  source = "../.."
  region = var.region

  context = module.this.context
}