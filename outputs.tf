output "ec2_public_ip" {
  description = "EC2'nin genel IP adresi"
  value       = aws_instance.web.public_ip
}
