# Data source to dynamically fetch the latest AMI ID
data "aws_ami" "latest" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_name_pattern]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# EC2 Instance resource
resource "aws_instance" "web" {
  ami                    = data.aws_ami.latest.id
  instance_type          = var.instance_type
  associate_public_ip_address = var.enable_public_ip

  # Root volume configuration
  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.root_volume_size
    delete_on_termination = true
    encrypted             = true

    tags = {
      Name = "${var.instance_name}-root-volume"
    }
  }

  # Metadata options
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
  }

  # Monitoring
  monitoring = false

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    CreatedBy   = "Terraform"
  }

  lifecycle {
    create_before_destroy = true
  }
}