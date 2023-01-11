output "id" {
    description = "ID of the domain."
    value = digitalocean_domain.domain.id
}

output "urn" {
    description = "URN of the domain."
    value = digitalocean_domain.domain.urn
}

output "ttl" {
    description = "TTL of the domain."
    value = digitalocean_domain.domain.ttl
}
