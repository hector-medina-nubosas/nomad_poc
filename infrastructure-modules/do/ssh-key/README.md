# SSH key.

Provides a DigitalOcean SSH key resource to allow you to manage SSH keys for Droplet access. Keys created with this resource can be referenced in your Droplet configuration via their ID or fingerprint

# Inputs.

Inputs are variable for customizing the module. 

## Required inputs.

- name : name of the SSH key.
- public-ssh-key-file : file that contains the public SSH key.
- do_token : API auth token. It is recommended to set a `TF_VAR_do_token` as a environment variable so it will load automatically.

## Optional inputs.

None.

# Outputs.

- id : ID of the SSH key.
- name : Name of the SSH key.
- fingerprint : Fingerprint of the SSH key.
- public_key : The text of the public key.

# Usage.

First, you have to set an environment variable called `TF_VAR_do_token` with the value of your access API token to digital ocean. This will allow you to perform calls to the digital ocean API.

We are assuming you have `id_ed25519.pub` file in the current directory that contains the public SSH key to upload to digital ocean.

## Terraform:

````
module "ssh-key" {
  source = "git@github.com:nubosas/infrastructure-modules.git//do/ssh-key"
  name = "SSH key DO-101-STA"
  public-ssh-key-file = "id_ed25519.pub"
}

````

## Terragrunt:

````
terraform {
  source = "git@github.com:nubosas/infrastructure-modules.git//do/ssh-key"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    name = "SSH key hector.medina@nubosas.com"
    public-ssh-key-file = "id_ed25519.pub"
}
````

