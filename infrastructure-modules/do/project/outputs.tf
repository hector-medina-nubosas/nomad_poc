output "id" {
    description = "ID of the project."
    value = digitalocean_project.project.id
}

output "owner_uuid" {
    description = "UUID of the project's owner."
    value = digitalocean_project.project.owner_uuid
}

output "owner_id" {
    description = "ID of the project's owner."
    value = digitalocean_project.project.owner_id
}

output "created_at" {
    description = "Timestamp value when the project was created."
    value = digitalocean_project.project.created_at
}

output "updated_at" {
    description = "Timestamp value when the project was last updated."
    value = digitalocean_project.project.updated_at
}

output "is_default" {
    description = "Boolean value to show if the project is the default project."
    value = digitalocean_project.project.is_default
}

output "resources" {
    description = "List of the resources associated with the project."
    value = digitalocean_project.project.resources
}