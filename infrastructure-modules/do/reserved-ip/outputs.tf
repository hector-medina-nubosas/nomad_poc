output "ip_address" {
    description = "IP address of the reserved IP."
    value = digitalocean_reserved_ip.public_ip.ip_address
}

output "urn" {
    description = "URN of the reserved IP."
    value = digitalocean_reserved_ip.public_ip.urn
}