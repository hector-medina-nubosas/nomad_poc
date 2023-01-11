output "id" {
  description = "ID of the VPC."
  value = digitalocean_vpc.vpc.id
}

output "urn" {
  description = "URN of the VPC."
  value = digitalocean_vpc.vpc.urn
}