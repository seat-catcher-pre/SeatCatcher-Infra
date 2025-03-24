output "instance_ids" {
  value = [for ec2 in aws_instance.this : ec2.id]
}