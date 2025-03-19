variable "aws_region" {
  description = "AWS bölgesi"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 örneğinin türü"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH için kullanılacak anahtar adı"
  default     = "my-key"
}
