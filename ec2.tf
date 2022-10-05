data "aws_ami" "ubuntu" {
    owners = ["aws-marketplace"]

    filter {
        name = "name"
        values = ["Minimal-Ubuntu-20-04*"]
    }
}

resource "aws_key_pair" "k8s_ssh" {
    key_name = "mark_k8s_key"
    public_key = var.ssh_public_key
}

resource "aws_instance" "k8s_masters" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.k8s_ssh.key_name
  associate_public_ip_address = true
  security_groups = [ aws_security_group.mark_k8s.id ]
  private_ip = "10.10.1.1${count.index}"
  user_data = "name=controller-${count.index}"

  subnet_id = aws_subnet.public.id

  ebs_block_device {
    delete_on_termination = true

    device_name ="/dev/sda1"

    tags = var.common_tags
    volume_size = 50
  }

  tags = merge(
    var.common_tags,
    {
        "Name" = "Mark K8s master"
    }
  )
}

resource "aws_instance" "k8s_workers" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.k8s_ssh.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.mark_k8s.id ]
  private_ip = "10.10.1.2${count.index}"
  user_data = "name=controller-${count.index}"

  subnet_id = aws_subnet.public.id

  ebs_block_device {
    delete_on_termination = true

    device_name ="/dev/sda1"

    tags = var.common_tags
    volume_size = 50
  }

  tags = merge(
    var.common_tags,
    {
        "Name" = "Mark K8s worker"
    }
  )
}