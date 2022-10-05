resource "aws_vpc" "mark_k8s" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = var.common_tags
}