resource "aws_iam_role" "developer_role" {
  name = "EKSDeveloperRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { AWS = "arn:aws:iam::123456789012:user/developer" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "developer_policy" {
  name        = "EKSReadOnlyPolicy"
  description = "Read-only access to EKS"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["eks:List*", "eks:Describe*"],
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "developer_attach" {
  role       = aws_iam_role.developer_role.name
  policy_arn = aws_iam_policy.developer_policy.arn
}
