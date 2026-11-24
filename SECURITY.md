# Security policy

This is a portfolio project. If you find a security issue, please open a
private security advisory in the repository's **Security** tab instead of a
public issue.

## Security controls in this repository

| Control | Tool | Blocks the pipeline? |
|---|---|---|
| Secret detection | Gitleaks | Yes |
| Dependency vulnerabilities | Trivy (filesystem) | Yes, HIGH/CRITICAL with a fix available |
| Container image vulnerabilities | Trivy (image) | Yes, HIGH/CRITICAL with a fix available |
| Terraform and Dockerfile misconfiguration | Checkov | Yes |
| Dockerfile best practices | Hadolint | Yes |
| Software bill of materials | Syft (SPDX) | No, informational |
| Image signing | Cosign keyless (Sigstore) | Release only |
| Cloud credentials | GitHub OIDC, no stored keys | Release only |
| Dependency updates | Dependabot | Opens pull requests |
