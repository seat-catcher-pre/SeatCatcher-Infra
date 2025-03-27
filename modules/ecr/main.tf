resource "aws_ecr_repository" "foo" {
  name                 = var.seatcatcher_dev_ecr_repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}