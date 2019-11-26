# terraform-alicloud-allin1website

AliCloud terraform-alicloud-allin1website module

## Introduction

This Terraform module demos how to leverage terraform to do a quick orchestrator the AliCloud resources.

- Create a new AliCloud VPC
- Create a new VSwitch
- Create the security groups and rules for our website demo
- Call the Cloud-Init for a quick initialization of the website instance
- Create a new DNS record to point to our new AliCloud instance

This is an allin1 project you can spawn up your AliCloud website within 2 minutes! 

## Prerequisite

- An AliCloud Domestic Account
- An ICP filed Domain on AliCloud (Using AliCloud DNS Management service)
- An AliCloud Client profile (To run with Terraform) 

## QuickStart

### Provision Instructions

```hcl-terraform
module "allin1website" {
  source  = "zhouyuanzhen/allin1website/alicloud"
  version = "0.0.x"
}
```

### Start with Terraform

```sh
terraform init

terraform plan

terraform apply
```

## Play with it

When the `terraform apply` successfully executed, you can test it by open HTTP website.
