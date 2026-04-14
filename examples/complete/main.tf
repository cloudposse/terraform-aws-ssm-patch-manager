module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.1"

  ipv4_primary_cidr_block = "172.16.0.0/16"

  context = module.this.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.4.2"

  availability_zones   = ["us-east-2a", "us-east-2b"]
  vpc_id               = module.vpc.vpc_id
  igw_id               = [module.vpc.igw_id]
  ipv4_cidr_block      = [module.vpc.vpc_cidr_block]
  nat_gateway_enabled  = true
  nat_instance_enabled = false

  context = module.this.context
}

module "ec2_instance" {
  source  = "cloudposse/ec2-instance/aws"
  version = "2.0.0"

  vpc_id          = module.vpc.vpc_id
  subnet          = module.subnets.private_subnet_ids[0]
  security_groups = [module.vpc.vpc_default_security_group_id]
  ami             = "ami-0beaa649c482330f7"
  ami_owner       = "amazon"
  ssh_key_pair    = ""
  instance_type   = "t3.micro"

  # Enabling SSM Patch manager policy, access to the log bucket and the additional tags
  ssm_patch_manager_enabled       = true
  ssm_patch_manager_s3_log_bucket = format("%s-%s-%s-%s", module.this.namespace, module.this.environment, module.this.stage, module.this.name)

  tags = {
    "Patch Group" : "TOPATCH",
  }

  context = module.this.context

}

module "ssm_patch_manager" {
  source = "../.."

  context = module.this.context
}
