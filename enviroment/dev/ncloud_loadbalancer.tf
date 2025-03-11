resource "ncloud_lb" "dev-loadbalancer" {
  name = "dev_loadbalancer"
  network_type = "PUBLIC"
  type = "APPLICATION"
  subnet_no_list = [ ncloud_subnet.dev_public_subnet.subnet_no ]
}

resource "ncloud_lb_target_group" "test" {
  vpc_no   = ncloud_vpc.test.vpc_no
  protocol = "HTTP"
  target_type = "VSVR"
  port        = 8080
  description = "for test"
  health_check {
    protocol = "HTTP"
    http_method = "GET"
    port           = 8080
    url_path       = "/monitor/l7check"
    cycle          = 30
    up_threshold   = 2
    down_threshold = 2
  }
  algorithm_type = "RR"
}

resource "ncloud_lb_target_group_attachment" "test" {
  target_group_no = ncloud_lb_target_group.test.target_group_no
  target_no_list = [ncloud_server.test.instance_no]
}

resource "ncloud_lb_listener" "test" {
  load_balancer_no = ncloud_lb.test.load_balancer_no
  protocol = "HTTP"
  port = 80
  target_group_no = ncloud_lb_target_group.test.target_group_no
}
