resource "aws_security_group" "altschool_sg" {
  name        = "altschool_sg"
  description = "security group for altschool projects"

  #   ingress {
  #     description = "inbound traffic for ssh"
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     # ipv6_cidr_blocks = ["::/0"]
  #   }

  #   ingress {
  #     description = "inbound traffic for ssh"
  #     from_port   = 80
  #     to_port     = 80
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     # ipv6_cidr_blocks = ["::/0"]
  #   }

  #   ingress {
  #     description = "inbound traffic for ssh"
  #     from_port   = 443
  #     to_port     = 443
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     # ipv6_cidr_blocks = ["::/0"]
  #   }

  # OR

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = terraform.workspace
  }
}