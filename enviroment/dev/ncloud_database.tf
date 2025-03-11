resource "ncloud_postgresql" "dev_postgresql" {
  service_name       = "dev-postgresql"
  server_name_prefix = "seat-catcher"
  user_name          = var.database_user_name
  user_password      = var.database_password
  vpc_no             = ncloud_vpc.dev_vpc.vpc_no
  subnet_no          = ncloud_subnet.dev_private_subnet.id
  client_cidr        = ncloud_subnet.dev_public_subnet.subnet
  database_name      = "seat_catcher"
  backup             = false # Backup 설정 -> 개발 환경에서는 필요 없기 때문에 false
  ha                 = false # High Availability 설정 -> 개발 환경에서는 필요 없기 때문에 false
}