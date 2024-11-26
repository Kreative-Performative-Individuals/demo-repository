# main.tf
# This file contains intentional misconfigurations for testing purposes.

# Why Trivy flags this:
# - Trivy performs Infrastructure as Code (IaC) analysis to detect security
#   misconfigurations in Terraform, Kubernetes manifests, and other configuration files.
# - The following issues are flagged:
#   - The `aws_security_group` resource allows ingress from "0.0.0.0/0",
#     making it accessible from anywhere in the world (misconfiguration).
#   - This configuration violates best practices for secure cloud infrastructure.

# Why Bandit does not flag this:
# - Bandit focuses on static code analysis for Python source code.
# - It does not analyze infrastructure configuration files like Terraform files.

# Terraform configuration with intentional misconfiguration:
resource "aws_security_group" "test" {
  name        = "test-security-group"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Open to the world (Trivy flags this as insecure)
  }
}
