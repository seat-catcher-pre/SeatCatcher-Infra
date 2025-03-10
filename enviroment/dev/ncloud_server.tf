resource "ncloud_login_key" "loginkey" {
  key_name = "test-key"
}

resource "ncloud_block_storage" "dev_block_storage" {
  size               = "10"
  server_instance_no = ncloud_server.dev_server.instance_no
  name               = "dev-block-storage"
  hypervisor_type = "KVM"
  zone = var.availability_zone[0]
  volume_type = "CB1"
}

resource "ncloud_public_ip" "dev_public_ip" {
  server_instance_no = ncloud_server.dev_server.id
}

data "ncloud_server_image_numbers" "server_images" {
  filter {
    name   = "name"
    values = ["ubuntu-22.04-base"]
  }
}

data "ncloud_server_specs" "spec" {
  filter {
    name   = "server_spec_code"
    values = ["s2-g3"]
  }
}

resource "ncloud_server" "dev_server" {
  subnet_no           = ncloud_subnet.dev_public_subnet.id
  name                = "dev-server"
  server_image_number = data.ncloud_server_image_numbers.server_images.image_number_list.0.server_image_number
  server_spec_code    = data.ncloud_server_specs.spec.server_spec_list.0.server_spec_code
  login_key_name      = ncloud_login_key.loginkey.key_name
}
