# output "urn" {
#   value = { for k, config in digitalocean_droplet.instances: k => config.urn }
# }

# output "urn" {
#   value = digitalocean_droplet.server_leader_client[*].urn
# }

# output "ip" {
#   value = digitalocean_droplet.server_leader_client[*].ipv4_address
# }

# output "ip_private" {
#   value = digitalocean_droplet.server_leader_client[*].ipv4_address_private
# }