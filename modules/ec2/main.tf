data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "instance" {
  ami                         = data.aws_ami.amzn-linux-2023-ami.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet
  user_data                   = file("../../scripts/cloud_init.sh")
  associate_public_ip_address = true
  key_name = aws_key_pair.instance_key_pair.key_name
  vpc_security_group_ids      = var.security_group_ids

  tags = {
    Name = "dev-instance"
  }
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "instance_key_pair" {
  key_name   = var.instance_key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
  depends_on = [ tls_private_key.ssh_key ]
}

resource "local_file" "private_key" {
  content = tls_private_key.ssh_key.private_key_pem
  filename = "${var.key_pair_save_path}/${var.instance_key_name}.pem"
  file_permission = "0400"
  depends_on = [ aws_key_pair.instance_key_pair ]
}