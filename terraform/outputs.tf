output "aws_role_arn" {
  description = "Set this as the AWS_ROLE_ARN repository variable in GitHub."
  value       = aws_iam_role.github_release.arn
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}
