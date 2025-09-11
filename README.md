# Terraform AWS Infrastructure

This project provisions AWS infrastructure using Terraform. It creates the following resources:

- **VPC** with configurable CIDR block
- **Public and Private Subnets** across multiple Availability Zones
- **S3 Bucket** with environment-based naming convention
- **IAM roles/policies**


Project Structure

-Providers.tf  - Provider information - AWS, Region
- Main.tf    - Root Configuration
- outputs.tf - Bucket information

   /envs
      /dev - values
      /prod - values
      /uat  - values
    
    /modules
       /ec2
       - main.tf
       - variables.tf

       /iam
       - main.tf
       - variables.tf

       /s3
       - main.tf
       - variables.tf
       - outputs.tf

       /vpc
       - main.tf
       - variables.tf
       - outputs.tf



