# Reserved IP.

A reserved IP allows you to create a static public IP in Digital Ocean. It can be attached to a droplet and a record domain afterwards.

# Inputs.

Inputs are variable for customizing the module. 

## Required inputs.

- region : A valid region for digital ocean.
- do_token : API auth token. It is recommended to set a `TF_VAR_do_token` as a environment variable so it will load automatically.

## Optional inputs.

None

# Outputs.

- ip_address : IP address value.
- urn : URN of the reserved ip resource.

# Usage.

First, you have to set an environment variable called `TF_VAR_do_token` with the value of your access API token to digital ocean. This will allow you to perform requests to the digital ocean API.

## Terraform:

````
module "reserved-io" {
    source = "git@github.com:nubosas/infrastructure-modules.git//do/reserved-ip"    
    region = "ams3"
}
````

## Terragrunt:

````
terraform {
  source = "git@github.com:nubosas/infrastructure-modules.git//do/reserved-ip"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    region = "ams3"
}
````