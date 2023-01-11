output "id" {
    description = "ID of the record."
    value = digitalocean_record.record.id
}

output "fqdn" {
    description = "FQDN of the record."
    value = digitalocean_record.record.fqdn
}