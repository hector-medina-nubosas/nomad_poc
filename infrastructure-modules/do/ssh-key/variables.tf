variable "name" {
    description = "Name of the ssh key."
    type = string
}

variable "public-ssh-key-file" {
    description = "Public ssh key file"
}

variable "do_token" {
    description = "API auth digital ocean token."
    type = string
}