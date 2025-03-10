resource "ncloud_access_control_group" "dev_acg" {
  name        = "dev-acg"
  description = "dev-acg"
  vpc_no      = ncloud_vpc.dev_vpc.id
}

resource "ncloud_access_control_group_rule" "dev-acg-rule" {
  access_control_group_no = ncloud_access_control_group.dev_acg.id

  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "22"
    description = "accept 22 port"
  }

  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "80"
    description = "accept 80 port"
  }

  outbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
    description = "accept 1-65535 port"
  }
}