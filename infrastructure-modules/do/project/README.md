# Project.

A project allows you to organize your resources into groups that fit the way you work and your environments.

# Inputs.

Inputs are variable for customizing the module. 

## Required inputs.

- name : name of the project. It allows spaces.
- environment : the environment has to match `Development`, `Staging` or `Production` values otherwise an error will be risen. 
- do_token : API auth token. It is recommended to set a `TF_VAR_do_token` as a environment variable so it will load automatically.

## Optional inputs.

- description (default `null`) : description of the project.
- purpose (default `Web Application`) : the purpose gives information about the goal of the project. It can match a built-in purpose like Just trying out DigitalOcean, Educational purposes, Website or blog, Web Application, Service or API, Mobile Application, Machine learning / AI / Data processing, IoT, Operational / Developer tooling or Other. If another value for purpose is specified, for example, 'your custom purpose', your purpose will be stored as 'Other: your custom purpose.'
- is_default (default `false`) :  It sets the project as default project, so all the resources without a project assigned will be attached to the default project. Default project cannot be deleted and just one default project can exist in an account. 

# Outputs.

- id : ID of the project.
- owner_uuid : UUID of the project's owner.
- id : ID of the project's owner.
- created_at : Timestamp value when the project was created.
- updated_at : Timestamp value when the project was last updated.
- is_default : Boolean value depending if the project is set as default project or not.
- resources : List of resources in the project.

# Usage.

First, you have to set an environment variable called `TF_VAR_do_token` with the value of your access API token to digital ocean. This will allow you to perform calls to the digital ocean API.

## Terraform:

````
module "project" {
    source = "git@github.com:nubosas/infrastructure-modules.git//do/project"
    name = "NOMAD STAGE"
    description = "Demo project for testing terragrunt and nomad."
    environment = "Staging"
}
````

## Terragrunt:

````
terraform {
  source = "git@github.com:nubosas/infrastructure-modules.git//do/project"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    name = "NOMAD STAGE"
    description = "Demo project for testing terragrunt and nomad."
    environment = "Staging"
}
````

