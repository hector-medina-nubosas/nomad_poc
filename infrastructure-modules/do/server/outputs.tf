output "leader_urn" {
    value = [ for instance in  digitalocean_droplet.leader_instance : instance.urn ]
}

output "leader_ip" {
    value = [ for instance in  digitalocean_droplet.leader_instance : instance.ipv4_address ]
}

output "leader_ip_private" {
    value = [ for instance in  digitalocean_droplet.leader_instance : instance.ipv4_address_private ]
}

output "instances_urn" {
    value = [ for instance in  digitalocean_droplet.instances : instance.urn ]
}

output "instances_ip" {
    value = [ for instance in  digitalocean_droplet.instances : instance.ipv4_address ]
}

output "instances_ip_private" {
    value = [ for instance in  digitalocean_droplet.instances : instance.ipv4_address_private ]
}