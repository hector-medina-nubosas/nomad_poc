variable "domain" {
    description = "Domain of the record to create."
    type = string
}

variable "type" {
    description = "Type of the record to create."
    type = string
    
    validation {
        condition     = contains(["A", "AAAA", "CAA", "CNAME", "MX", "NS", "TXT", "SRV"], var.type)
        error_message = "Allowed values for type are \"A\", \"AAAA\", \"CAA\", \"CNAME\", \"MX\", \"NS\", \"TXT\" or \"SRV\"."
    }
}

variable "name" {
    description = "Name of the record to create."
    type = string
}

variable "ip" {
    description = "Value of the record to create."
    type = string
}

variable "do_token" {
    description = "API auth digital ocean token."
    type = string
}