# 서버 인스턴스 적용 보안 그룹
resource "ncloud_access_control_group" "dev_server_acg" {
  name        = "dev-acg"
  description = "dev-acg"
  vpc_no      = ncloud_vpc.dev_vpc.vpc_no
}

# 본인 컴퓨터 IP 확인
data "http" "my_ip" {
  url = "https://api.ipify.org?format=text"
}

# 서버 인스턴스 적용 보안 그룹 규칙
resource "ncloud_access_control_group_rule" "dev-server-acg-rule" {
  access_control_group_no = ncloud_access_control_group.dev_server_acg.id

  inbound {
    protocol    = "TCP"
    ip_block    = "${data.http.my_ip.response_body}/32"
    port_range  = "22"
    description = "accept ssh port"
  }

  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "8080"
    description = "only accept spring boot application request from load balancer"
  }

  outbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
    description = "accept 1-65535 port"
  }
}
