resource "aws_subnet" "public" {
    vpc_id = aws_vpc.mark_k8s.id
    cidr_block = var.public_subnet_cidr
}

resource "aws_route_table" "k8s" {
  vpc_id = aws_vpc.mark_k8s.id

  route {
    cidr_block = var.web_cidr
    gateway_id = aws_internet_gateway.k8s.id
  }

  tags = var.common_tags
}

resource "aws_route_table_association" "k8s" {
  subnet_id         = aws_subnet.public.id
  route_table_id = aws_route_table.k8s.id
}