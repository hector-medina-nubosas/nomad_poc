# Domain.

A domain allows you to manage a domain in Digital Ocean.

# Inputs.

Inputs are variable for customizing the module. 

## Required inputs.

- name : name of the domain.
- do_token : API auth token. It is recommended to set a `TF_VAR_do_token` as a environment variable so it will load automatically.

## Optional inputs.

None

# Outputs.

- id : ID of the domain.
- urn : URN of the domain.
- ttl : The TTL value of the domain.

# Usage.

First, you have to set an environment variable called `TF_VAR_do_token` with the value of your access API token to digital ocean. This will allow you to perform requests to the digital ocean API.

## Terraform:

````
module "domain" {
    source = "git@github.com:nubosas/infrastructure-modules.git//do/domain"
    name = "hectormedina.es"
}
````

## Terragrunt:

````
terraform {
  source = "git@github.com:nubosas/infrastructure-modules.git//do/domain"
}

include {
  path = find_in_parent_folders()
}


inputs = {
    name        = "hectormedina.es"
}

````