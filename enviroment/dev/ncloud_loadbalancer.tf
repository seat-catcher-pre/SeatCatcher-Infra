resource "ncloud_lb" "dev_lb" {
  name            = "dev-application-loadbalancer"
  network_type    = "PUBLIC"
  type            = "APPLICATION"
  subnet_no_list  = [ncloud_subnet.dev_alb_public_subnet.subnet_no]
  throughput_type = "SMALL"
}

resource "ncloud_lb_listener" "dev_lb_listener" {
  load_balancer_no   = ncloud_lb.dev_lb.load_balancer_no
  protocol           = "HTTPS"
  port               = 443
  target_group_no    = ncloud_lb_target_group.dev_server_tg.target_group_no
  ssl_certificate_no = var.ssl_cert_number
}

resource "ncloud_lb_target_group" "dev_server_tg" {
  vpc_no      = ncloud_vpc.dev_vpc.vpc_no
  protocol    = "HTTP"
  target_type = "VSVR"
  port        = 80
  description = "for test"
  health_check {
    protocol       = "HTTP"
    http_method    = "GET"
    port           = 80
    url_path       = "/"
    cycle          = 30
    up_threshold   = 2
    down_threshold = 2
  }
  algorithm_type = "RR"
}

resource "ncloud_lb_target_group_attachment" "dev_tg_attatchment" {
  target_group_no = ncloud_lb_target_group.dev_server_tg.target_group_no
  target_no_list  = [ncloud_server.dev_server.instance_no]
}