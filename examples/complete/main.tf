module "ssm_patch_manager" {
  source = "../.."
  region = var.region

  context = module.this.context
}
