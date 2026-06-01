# IAM Role for EC2 Admin Access
resource "aws_iam_role" "ec2_admin_role" {
  name               = "${var.instance_name}-admin-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach Admin Policy
resource "aws_iam_role_policy_attachment" "ec2_admin_policy" {
  role       = aws_iam_role.ec2_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_admin_profile" {
  name = "${var.instance_name}-admin-profile"
  role = aws_iam_role.ec2_admin_role.name
}
