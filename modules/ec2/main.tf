data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "dev_api_instance" {
  ami                         = data.aws_ami.amzn-linux-2023-ami.id
  instance_type               = var.instance_type
  subnet_id                   = element(var.subnets, 0)
  user_data                   = file("../scripts/cloud_init.sh")
  associate_public_ip_address = true

  tags = {
    Name = "dev-api-instance"
  }
}

resource "aws_instance" "dev_docs_instance" {
  ami                         = data.aws_ami.amzn-linux-2023-ami.id
  instance_type               = var.instance_type
  subnet_id                   = element(var.subnets, 0)
  user_data                   = file("../scripts/cloud_init.sh")
  associate_public_ip_address = true

  tags = {
    Name = "dev-docs-instance"
  }
}
