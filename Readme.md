🧠 Key Concepts

# Modules (/modules/)
Define infrastructure in reusable chunks.

Separate by resource domain (e.g., networking, compute).

Parameterize via ```variables.tf```.

Output key resources using ```outputs.tf```.

Example: ```/modules/networking/variables.tf```

```
variable "vpc_cidr" {}
variable "region" {}
Example: /modules/networking/main.tf
```

```
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}
```

# Environments (/envs/)

Define real-world deployments per cloud & environment.

Call modules with appropriate variables.

Example: ```/envs/dev/aws/main.tf```

```
module "vpc" {
  source    = "../../../modules/networking"
  vpc_cidr  = var.vpc_cidr
  region    = var.region
}
```
Example: ```/envs/dev/aws/terraform.tfvars```

```
vpc_cidr = "10.0.0.0/16"
region   = "us-east-1"
```

# Global Configs (/globals/)

Define:

Terraform versions (versions.tf)

Common providers (AWS, Azure, GCP) in providers.tf

Any constants shared across environments.

# Backend Configuration
Store remote state in backend (S3 for AWS, GCS for GCP, etc.).

Use backend.tf inside each environment folder.

Example AWS backend: ```/envs/dev/aws/backend.tf```

```
terraform {
  backend "s3" {
    bucket = "your-tfstate-bucket"
    key    = "dev/aws/terraform.tfstate"
    region = "us-east-1"
  }
}
```

# 🛠 Jenkins Automation Setup
Jenkins Pipeline Flow
### Jenkinsfile (simplified)
```
pipeline {
  agent any

  environment {
    TF_VAR_env = "${ENV}"
  }

  parameters {
    string(name: 'ENV', defaultValue: 'dev', description: 'Environment to deploy')
    choice(name: 'CLOUD', choices: ['aws', 'azure', 'gcp'], description: 'Cloud provider')
  }

  stages {
    stage('Init') {
      steps {
        sh "cd envs/${ENV}/${CLOUD} && terraform init"
      }
    }
    stage('Plan') {
      steps {
        sh "cd envs/${ENV}/${CLOUD} && terraform plan -var-file=terraform.tfvars"
      }
    }
    stage('Apply') {
      when {
        expression { return params.ENV != 'prod' } // Add approval for prod
      }
      steps {
        sh "cd envs/${ENV}/${CLOUD} && terraform apply -auto-approve -var-file=terraform.tfvars"
      }
    }
  }
}
```

# 🧱 Terraform Best Practices

Module Best Practices
Keep modules atomic and reusable.

Do not hardcode providers inside modules. Use provider blocks at root level.

Always define inputs (variables.tf) and outputs (outputs.tf).

Remote State
Always use remote backends.

Enable state locking (e.g., with DynamoDB for AWS).

Environment Best Practices
Maintain strict separation — no sharing of resources unless explicitly global.

Use naming conventions like dev-vpc, prod-vpc etc.

# Security
Store secrets in Secrets Manager, not in TF files.

Restrict state file access — contains sensitive data!

# CI/CD Best Practices
Validate TF code using terraform validate and terraform fmt.

Use terraform workspace cautiously; prefer directory-based environments.

For prod — require manual approval before apply.

# 🧪 Optional Enhancements

Tool	Purpose
tfsec	Static security analysis
tflint	Linting and code analysis
infracost	Estimate cloud costs
Terragrunt	(Optional) DRY and better module reusability
pre-commit	Hook for formatting, validation