resource "aws_key_pair" "aws_key_pair" {
  key_name   = "aws_key_pair"
  public_key = var.aws_key_pub
}
resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "aws_subnet" {
  vpc_id     = aws_vpc.aws_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.aws_key_pair.key_name
  subnet_id                   = aws_subnet.aws_subnet.id
  vpc_security_group_ids      = [aws_security_group.aws_security_group.id]
  associate_public_ip_address = true

  tags = {
    Name = "aws_vm"
  }
}

resource "aws_security_group" "aws_security_group" {
  name        = "aws_security_group"
  description = "Security group for AWS instance"
  vpc_id      = aws_vpc.aws_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
