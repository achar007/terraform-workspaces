# Terraform Workspace Demo

This repository demonstrates how to use [Terraform Workspaces](https://developer.hashicorp.com/terraform/language/state/workspaces) to manage multiple environments (dev, stage, prod) with a simple AWS EC2 example.

## Project Structure

```
main.tf                # Root Terraform configuration
terraform.tfvars       # Variable definitions
modules/
  ec2_instance/        # Example module for EC2 instance
    main.tf
terraform.tfstate.d/   # State files for each workspace
  dev/
    terraform.tfstate
    terraform.tfstate.backup
  prod/
  stage/
    terraform.tfstate
    terraform.tfstate.backup
```

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 0.12
- AWS CLI configured with credentials

## Step-by-Step Demo

### 1. Initialize the Project
```bash
terraform init
```

### 2. Create and Select a Workspace
List available workspaces:
```bash
terraform workspace list
```
Create a new workspace (e.g., `dev`):
```bash
terraform workspace new dev
```
Switch to an existing workspace (e.g., `stage`):
```bash
terraform workspace select stage
```

### 3. Configure Variables
Edit `terraform.tfvars` to set your AMI ID and instance type:
```hcl
ami_id = "ami-xxxxxxxxxxxxxxxxx"
instance_type = "t2.micro"
```

### 4. Plan and Apply Infrastructure
```bash
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### 5. Verify State Files
Each workspace has its own state under `terraform.tfstate.d/<workspace>/`.

## Clean Up
To destroy resources in the current workspace:
```bash
terraform destroy -var-file=terraform.tfvars
```

## Notes
- Use workspaces to separate environments and avoid resource conflicts.
- Store sensitive variables securely.
- Use modules for reusable infrastructure.

## License
MIT
