data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    bucket = var.terraform_state_bucket
    key    = var.dev_key
    region = var.region
  }
}

module "dns" {
  source                 = "../../modules/route53"
  domain_name            = var.domain_name
  dev_instance_public_ip = data.terraform_remote_state.dev.outputs.dev_instance_public_ip
  dev_sub_domain_name    = var.dev_sub_domain_name
  dev_api_domain_name    = var.dev_api_domain_name
  dev_docs_domain_name   = var.dev_docs_domain_name
}