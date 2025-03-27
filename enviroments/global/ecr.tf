module "ecr" {
  source                        = "../../modules/ecr"
  seatcatcher_dev_ecr_repo_name = var.seatcatcher_dev_ecr_repo_name
}