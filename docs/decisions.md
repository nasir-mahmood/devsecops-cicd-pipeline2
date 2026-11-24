# Design decisions

## 1. OIDC instead of stored AWS keys
Long-lived access keys in GitHub secrets can leak and must be rotated. GitHub
OIDC issues a short-lived token per run, and the IAM trust policy accepts it
only from the `main` branch of this repository.

## 2. Security checks run before release, not after
On every push to `main`, the release workflow reuses the **CI** and
**Security** workflows as jobs, and the publish job `needs` both of them. A vulnerable or misconfigured build never reaches the
registry.

## 3. Fail only on fixable HIGH/CRITICAL findings
`ignore-unfixed: true` stops the pipeline from blocking on vulnerabilities
that have no patch yet. The full report still goes to the Security tab, and a
weekly scheduled scan catches newly published CVEs.

## 4. Immutable tags and signing by digest
ECR tags are immutable and images are tagged with the commit SHA. Cosign signs
the image digest, so the signature always refers to exactly what was built.

## 5. Release job is optional
The release job runs only when the `AWS_ROLE_ARN` repository variable exists,
so anyone can fork the repo and get a green pipeline without an AWS account.
