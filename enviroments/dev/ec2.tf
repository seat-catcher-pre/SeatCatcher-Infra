module "dev-instance" {
  source        = "../../modules/ec2"
  public_subnet = module.dev_vpc.public_subnet_id
  # use default instance type (t2.micro)
  instance_key_name  = var.dev_instance_key_name
  key_pair_save_path = var.dev_key_pair_save_path
}