output "instance_ids" {
  value = [for ec2 in aws_instance.this : ec2.id]
}

output "api_instance_public_ip" {
  value = aws_instance.dev_api_instance.public_ip
}

output "docs_instance_public_ip" {
  value = aws_instance.dev_docs_instance.public_ip
}