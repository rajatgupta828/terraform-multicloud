resource "aws_instance" "web_server" {
  ami           = var.linux_2_ami # Amazon Linux 2 (Free Tier eligible) in ap-south-1
  instance_type = var.bastion_instance_type
  subnet_id     = var.private_subnet_ids[0]  # Put it in first private subnet
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = false
  key_name = var.instance_key # replace with your key pair name
  tags = {
    Name = "rajat-test-web-server"
  }
}

resource "aws_instance" "bastion" {
  ami           = var.linux_2_ami
  instance_type = var.bastion_instance_type
  subnet_id     = var.public_subnet_ids[0]  # Put it in first public subnet
  key_name      = var.instance_key
  associate_public_ip_address = true
  tags = {
    Name = "bastion-host"
  }
  vpc_security_group_ids = [var.bastion_sg_id]
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow inbound traffic to web server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # restrict to VPC
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # restrict to VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

