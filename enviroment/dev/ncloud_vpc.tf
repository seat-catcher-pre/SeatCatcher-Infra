resource "ncloud_vpc" "dev_vpc" {
  ipv4_cidr_block = "10.0.0.0/16"
  name            = "dev-vpc"
}

resource "ncloud_subnet" "dev_public_subnet" {
  vpc_no         = ncloud_vpc.dev_vpc.id
  subnet         = "10.0.0.0/24"
  zone           = var.availability_zone[0]
  network_acl_no = ncloud_vpc.dev_vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  name           = "dev-public-subnet"
  usage_type     = "GEN"
}

resource "ncloud_subnet" "dev_private_subnet" {
  vpc_no         = ncloud_vpc.dev_vpc.id
  subnet         = "10.0.1.0/24"
  zone           = var.availability_zone[0]
  network_acl_no = ncloud_vpc.dev_vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  name           = "dev-private-subnet"
  usage_type     = "GEN"
}

resource "ncloud_network_interface" "dev_server_nic" {
  name                  = "dev-server-nic"
  description           = "dev-server-nic"
  subnet_no             = ncloud_subnet.dev_public_subnet.id
  access_control_groups = [ncloud_access_control_group.dev_server_acg.id]
}