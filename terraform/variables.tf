variable "aws_region" {
  description = "AWS region for the ECR repository."
  type        = string
  default     = "us-east-1"
}

variable "github_repository" {
  description = "GitHub repository allowed to assume the role, as owner/name."
  type        = string
  default     = "nasir-mahmood/devsecops-cicd-pipeline"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository."
  type        = string
  default     = "devsecops-demo"
}

variable "create_oidc_provider" {
  description = "Set false if the GitHub OIDC provider already exists in the account."
  type        = bool
  default     = true
}
