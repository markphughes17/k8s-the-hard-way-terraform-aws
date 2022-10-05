resource "aws_security_group" "mark_k8s" {
  name        = "Mark_K8s"
  description = "Kubernetes Security Group"
  vpc_id      = aws_vpc.mark_k8s.id

  ingress {
    description      = "All traffic from inside VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = [ var.vpc_cidr ]
  }

  ingress {
    description      = "SSH traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ var.web_cidr ]
  }

  ingress {
    description      = "K8s api traffic"
    from_port        = 6443
    to_port          = 6443
    protocol         = "tcp"
    cidr_blocks      = [ var.web_cidr ]
  }

  ingress {
    description      = "TLS traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [ var.web_cidr ]
  }

  ingress {
    description      = "icmp traffic"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [ var.web_cidr ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.common_tags
}