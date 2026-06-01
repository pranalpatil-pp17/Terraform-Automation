variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 8
}

variable "ami_owner" {
  description = "AMI owner (e.g., 'amazon' for Amazon Linux 2, '099720109477' for Ubuntu)"
  type        = string
  default     = "099720109477"
}

variable "ami_name_pattern" {
  description = "AMI name pattern for filtering"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "terraform-ec2-instance"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "enable_public_ip" {
  description = "Associate public IP address with instance"
  type        = bool
  default     = true
}
