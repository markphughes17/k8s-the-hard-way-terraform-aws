resource "aws_lb" "k8s" {
  name               = "markK8s"
  internal           = false
  load_balancer_type = "network"
  subnets            = [ aws_subnet.public.id ]

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = var.common_tags
}

resource "aws_lb_target_group" "k8s" {
  name     = "markK8sTargetGroup"
  port     = 6443
  protocol = "TCP"
  vpc_id   = aws_vpc.mark_k8s.id
  target_type = "ip"

  tags = var.common_tags
}

resource "aws_lb_target_group_attachment" "k8s_master_1" {
  target_group_arn = aws_lb_target_group.k8s.arn
  target_id        = "10.10.1.10"
}

resource "aws_lb_target_group_attachment" "k8s_master_2" {
  target_group_arn = aws_lb_target_group.k8s.arn
  target_id        = "10.10.1.11"
}

resource "aws_lb_target_group_attachment" "k8s_master_3" {
  target_group_arn = aws_lb_target_group.k8s.arn
  target_id        = "10.10.1.12"
}

resource "aws_lb_listener" "k8s" {
  load_balancer_arn = aws_lb.k8s.arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.k8s.arn
  }

  tags = var.common_tags
}

output "aws_lb_k8s_dns_name" {
    value = aws_lb.k8s.dns_name
}