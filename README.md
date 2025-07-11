# terraform_gitactions_rds_python

This repository contains Terraform configuration and a GitHub Actions pipeline to provision an AWS RDS database instance with automated backups to the S3 bucket `optum-prod-bkt`.

## Features

- Provisions an AWS RDS instance using Terraform.
- Configures automated backups to an S3 bucket.
- GitHub Actions workflow to automate the deployment.

## Usage

1. Store your AWS credentials in GitHub Secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
2. Update the Terraform variables as needed.
3. Push changes to trigger the GitHub Actions pipeline.

## Security

- Do **NOT** commit sensitive credentials to this repository.
- Use GitHub secrets for all sensitive values.
