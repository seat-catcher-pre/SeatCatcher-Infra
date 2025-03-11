# resource "ncloud_lb" "dev_lb" {
#   name = "dev_application_loadbalancer"
#   network_type = "PUBLIC"
#   type = "APPLICATION"
#   subnet_no_list = [ ncloud_subnet.dev_public_subnet.subnet_no ]
#   throughput_type = "SMALL"
# }

# resource "ncloud_lb_listener" "dev_lb_listener" {
#   load_balancer_no = ncloud_lb.dev_lb.load_balancer_no
#   protocol = "HTTPS"
#   port = 443
#   target_group_no = ncloud_lb_target_group.dev_lb_target_group.target_group_no
#   ssl_certificate_no = 
# }
