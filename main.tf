# AWS sağlayıcısını tanımla
provider "aws" {
  region = "us-east-1" # AWS bölgesini belirle (ihtiyacına göre değiştir)
}

# Güvenlik grubu oluştur
resource "aws_security_group" "nginx_sg" {
  name        = "nginx-security-group"
  description = "Allow HTTP and SSH"

  # SSH erişimi (22 numaralı port)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP erişimi (80 numaralı port)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Dışarıya tüm trafiği aç
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Örneği oluştur
resource "aws_instance" "web" {
  ami             = "ami-0b74f796d330ab49c" # Güncel AMI ID'sini AWS konsolundan öğren
  instance_type   = "t2.micro"
  key_name        = "my-key" # EC2 erişimi için anahtar adı (Var olan bir anahtar olmalı)
  security_groups = [aws_security_group.nginx_sg.name]

  # Nginx yüklemek için User Data kullanıyoruz
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "Terraform-EC2-Nginx"
  }
}

# EC2'nin Genel IP'sini çıktı olarak al
output "public_ip" {
  value = aws_instance.web.public_ip
}
