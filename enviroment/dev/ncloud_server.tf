resource "ncloud_login_key" "loginkey" {
  key_name = "test-key"
}

resource "local_file" "loginkey_file" {
  content         = ncloud_login_key.loginkey.private_key
  filename        = "${path.module}/server-key.pem"
  file_permission = "0400"
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
    values = ["mi1-g3"]
  }
}

resource "ncloud_server" "dev_server" {
  subnet_no            = ncloud_subnet.dev_public_subnet.id
  name                 = "dev-server"
  server_image_number  = data.ncloud_server_image_numbers.server_images.image_number_list.0.server_image_number
  server_spec_code     = data.ncloud_server_specs.spec.server_spec_list.0.server_spec_code
  login_key_name       = ncloud_login_key.loginkey.key_name
  fee_system_type_code = "FXSUM"
  init_script_no       = ncloud_init_script.server_init.id
  network_interface {
    network_interface_no = ncloud_network_interface.dev_server_nic.id
    order                = 0
  }
}

resource "ncloud_init_script" "server_init" {
  name    = "server-initiate-script"
  content = file("${path.module}/cloud_init.sh")
}

output "dev_server_ip" {
  value = ncloud_server.dev_server.public_ip
}
