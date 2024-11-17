# Example Terraform file with a security misconfiguration
resource "aws_security_group" "test" {
  name        = "test-security-group"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Open to the world (flagged as insecure)
  }
}
