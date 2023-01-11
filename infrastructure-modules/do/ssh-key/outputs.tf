output "fingerprint" {
    description = "Fingerprint of the SSH key."
    value = digitalocean_ssh_key.ssh-key.fingerprint
}

output "name" {
    description = "Name of the SSH key."
    value = digitalocean_ssh_key.ssh-key.name
}

output "id" {
    description = "ID of the SSH key."
    value = digitalocean_ssh_key.ssh-key.id
}

output "public_key" {
    description = "Text of the public key."
    value = digitalocean_ssh_key.ssh-key.public_key
}