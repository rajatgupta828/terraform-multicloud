# Usage

This repository contains a set of terraform files to create entire infrastructure on all clouds.

# Repository structure


# Steps
 ## Stage 1:

We can start by creating a vpc and subnets using terraform.
For that use the following command : 

### Initialise the backend

```bash
cd components/stage1_network_with_compute/
```

Initialise the backend later...

```bash
terraform init --backend-config=../../backend-configs/aws-dev-backend.hcl
```
### Plan

See the changes that this script is going to do.

```bash
 terraform plan \
  -var-file="../../globals/terraform.tfvars" \
  -var-file="../../environments/dev/aws/terraform.tfvars"
```

### Apply

```bash
 terraform apply \
  -var-file="../../globals/terraform.tfvars" \
  -var-file="../../environments/dev/aws/terraform.tfvars"
```