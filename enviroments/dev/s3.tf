# Bucket for terraform state is managed by administrator, not terraform!!!

module "seatcatcher_images" {
  source      = "../../modules/s3"
  bucket_name = var.seatcatcher_images_bucket
}