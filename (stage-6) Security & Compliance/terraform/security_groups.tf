resource "aws_security_group" "db_sg" {
  name        = "database-sg"
  description = "Allow only EKS traffic"
  vpc_id      = aws_vpc.onfinance_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.onfinance_vpc.cidr_block]  # Only allow VPC traffic
  }
}
