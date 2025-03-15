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

  dynamic "inbound" {
    for_each = var.backend_team
    content {
      protocol    = "TCP"
      ip_block    = "${inbound.value}/32"
      port_range  = "22"
      description = "only accept spring boot application request from backend team"
    }
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

# 자동 생성된 PostgreSQL ACG 참조
data "ncloud_access_control_group" "dev_database_acg" {
  name = "cloud-postgresql-1pm0kw"
}

#Default PostgreSQL ASG Rule (from import)
resource "ncloud_access_control_group_rule" "dev_database_acg_rule" {
  access_control_group_no = data.ncloud_access_control_group.dev_database_acg.access_control_group_no

  inbound {
    protocol                       = "ICMP"
    source_access_control_group_no = ncloud_access_control_group.dev_server_acg.id
    description                    = "Accept ICMP request from dev-server"
  }

  inbound {
    protocol                       = "TCP"
    source_access_control_group_no = ncloud_access_control_group.dev_server_acg.access_control_group_no
    port_range                     = "5432"
    description                    = "Accept PostgreSQL request from dev-server"
  }

  outbound {
    protocol   = "TCP"
    ip_block   = ncloud_vpc.dev_vpc.ipv4_cidr_block
    port_range = "1-65535"
  }
}
