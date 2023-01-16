# Domain record.

A domain record allows you to manage a record of a domain in Digital Ocean.

# Inputs.

Inputs are variable for customizing the module. 

## Required inputs.

- domain : id of the domain attached to this record.
- type : Type of the record, just 'A', 'AAA', 'CAA', 'CNAME', 'MX', 'NS', 'TXT' o 'SRV' are valid values.
- name : Name of the record to be created. If you want to create `subdomain.domain.com` this value should be `subdomain`. If you want to create the `domain.com` record this value should be `@`.
- ip : IP Address to be attached to this record.
- do_token : API auth token. It is recommended to set a `TF_VAR_do_token` as a environment variable so it will load automatically.

## Optional inputs.

None

# Outputs.

- id : ID of the record.
- fdqn : The FQDN of the record. For example, 'subdomain.domain.com`.

# Usage.

First, you have to set an environment variable called `TF_VAR_do_token` with the value of your access API token to digital ocean. This will allow you to perform requests to the digital ocean API.

## Terraform:

````
module "domain-record" {
    source = "git@github.com:nubosas/infrastructure-modules.git//do/domain-record"
    domain = data.domain.outputs.id
    type = "A"
    name = "nomad"
    ip = data.reserved-ip.outputs.ip_address
}
````

## Terragrunt:

````
terraform {
  source = "git@github.com:nubosas/infrastructure-modules.git//do/domain-record"
}

include {
  path = find_in_parent_folders()
}

dependency "domain" {
    config_path = "../../global/domain"
}

dependency "reserved-ip" {
  config_path = "../reserved-ip"
}

inputs = {
    domain = dependency.domain.outputs.id
    type = "A"
    name = "nomad"
    ip = dependency.reserved-ip.outputs.ip_address
}
````