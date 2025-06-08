# Terraform Workspaces Project

This project uses [Terraform](https://www.terraform.io/) to manage infrastructure as code, supporting multiple environments (dev, stage, prod) using [Terraform Workspaces](https://developer.hashicorp.com/terraform/language/state/workspaces).

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

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Select or Create a Workspace
```bash
terraform workspace list
terraform workspace new <workspace-name>   # e.g., dev, stage, prod
terraform workspace select <workspace-name>
```

### 3. Plan and Apply
```bash
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### 4. Module Usage
Modules are defined in the `modules/` directory. For example, the `ec2_instance` module can be referenced in your `main.tf`:

```
module "ec2_instance" {
  source = "./modules/ec2_instance"
  # ...module variables...
}
```

## State Management
- State files are managed per workspace under `terraform.tfstate.d/<workspace>/`.
- Always select the correct workspace before running `plan` or `apply`.

## Requirements
- [Terraform](https://www.terraform.io/downloads.html) >= 0.12
- AWS CLI (if using AWS resources)
- Properly configured cloud credentials

## Best Practices
- Use workspaces to separate environments.
- Store sensitive variables securely (avoid committing secrets).
- Use modules for reusable infrastructure components.

## License
MIT
