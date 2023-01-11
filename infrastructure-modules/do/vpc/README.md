# Virtual Private Cloud (VPC).

VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.

# Inputs.

Inputs are variable for customizing the module. 

## Required inputs.

- name : name of the virtual private cloud. It doesn't allow blank spaces.
- region : string value that contains a valid region.
- ip_range : ip range to assign to the VPC network. 
- do_token : API auth token. It is recommended to set a `TF_VAR_do_token` as a environment variable so it will load automatically.

## Optional inputs.

None.

# Outputs.

- id : ID of the VPC.
- urn : URN of the VPC.

# Usage.

First, you have to set an environment variable called `TF_VAR_do_token` with the value of your access API token to digital ocean. This will allow you to perform calls to the digital ocean API.

## Terraform:

````
module "project" {
    source = "git@github.com:hector-medina-nubosas/infrastructure-modules.git//do/vpc"
    name = "Stage-VPC"
    region = "ams3"
    ip_range = "10.10.0.0/24"
}
````

## Terragrunt:

````
terraform {
  source = "git@github.com:hector-medina-nubosas/infrastructure-modules.git//do/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    name = "Stage-VPC"
    region = "ams3"
    ip_range = "10.10.0.0/24"
}
````

