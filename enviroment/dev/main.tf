terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }

  required_version = ">= 0.13"

  backend "s3" {
    bucket = "seatchatcher-tfstate-backend"
    key    = "seatcatcher-terraform-remote-state/terraform.tfstate"

    # Set the region according to your location
    region     = "KR"
    access_key = var.access_key
    secret_key = var.secret_key

    # To skip AWS authentication logic
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true

    # For state locking
    use_lockfile = true

    endpoints = {
      # Set the endpoint according to your region
      s3 = "https://kr.object.ncloudstorage.com"
    }
  }
}

provider "ncloud" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  region      = var.region
  site        = var.site
  support_vpc = var.support_vpc
}
