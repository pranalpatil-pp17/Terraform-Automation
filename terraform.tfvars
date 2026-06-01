aws_region          = "us-east-1"
instance_type        = "t3.micro"
root_volume_size     = 8
ami_owner            = "amazon"
ami_name_pattern     = "amzn2-ami-hvm-*-x86_64-gp2"
instance_name        = "terraform-ec2-instance"
environment          = "development"
enable_public_ip     = true
