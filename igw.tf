resource "aws_internet_gateway" "k8s" {
  vpc_id = aws_vpc.mark_k8s.id

  tags = var.common_tags
}