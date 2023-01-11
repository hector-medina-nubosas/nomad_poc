variable "name" {
    description = "Name of the VPC."
    type = string
}

variable "region" {
    description = "Region of the VPC."
    type = string
}

variable "ip_range" {
    description = "IP range of the VPC."
    type = string
}

variable "do_token" {
    description = "API auth digital ocean token."
    type = string
}