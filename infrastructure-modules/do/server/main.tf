terraform {
    required_version = ">= 1.3, < 2.0.0"
    required_providers {
      digitalocean = {
        source = "digitalocean/digitalocean"
      }
    }
}

provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "leader_instance" {

    for_each    = { 
        for k, instance in var.config : k => instance 
        if instance.leader == true
     }

    name        = each.key

    image       = lookup(each.value, "image")
    size        = lookup(each.value, "size")
    user_data = "${templatefile("init.sh", {
      server_role = lookup(each.value, "role")
      server_join = null
    })}"

    region      = var.region
    ssh_keys    = var.ssh_keys_fingerprints
    vpc_uuid    = var.vpc_id

    # Wait until provisioning finish.
    provisioner "remote-exec" {
      connection {
        private_key = "${file("~/.ssh/id_ed25519")}"
        host = self.ipv4_address
      }
      inline = [
          "while [ $(cloud-init status | awk '{print $2}') != done ]; do  sleep 1; done"
      ]
    }
}


resource "digitalocean_reserved_ip_assignment" "leader_public_ip" {
  for_each    = { 
    for k, instance in var.config : k => instance 
    if instance.leader == true
  }
  ip_address = lookup(each.value, "public_ip")
  droplet_id = local.leader_id
}

locals {
    leader_private_ip = digitalocean_droplet.leader_instance[keys(digitalocean_droplet.leader_instance)[0]].ipv4_address_private
    leader_urn = digitalocean_droplet.leader_instance[keys(digitalocean_droplet.leader_instance)[0]].urn
    leader_id = digitalocean_droplet.leader_instance[keys(digitalocean_droplet.leader_instance)[0]].id
}


resource "digitalocean_droplet" "instances" {

    depends_on = [
      digitalocean_droplet.leader_instance
    ]

    for_each    = { 
        for k, instance in var.config : k => instance 
        if instance.leader != true
    }

    name        = each.key

    image       = lookup(each.value, "image")
    size        = lookup(each.value, "size")
    user_data = "${templatefile("init.sh", {
      server_role = lookup(each.value, "role"),
      server_join = jsonencode({server_join = [ local.leader_private_ip ]})
    })}"

    region      = var.region
    ssh_keys    = var.ssh_keys_fingerprints
    vpc_uuid    = var.vpc_id

    # Wait until provisioning finish.
    provisioner "remote-exec" {
      connection {
        private_key = "${file("~/.ssh/id_ed25519")}"
        host = self.ipv4_address
      }
      inline = [
          "while [ $(cloud-init status | awk '{print $2}') != done ]; do  sleep 1; done"
      ]
    }

}


# #!/bin/bash

# status=$(systemctl status nomad | grep Active: | awk '{print $2}')

# if [ $status == 'active' ]
# then p
# 	echo "todo bien"
# else 
# 	echo "mal"
# fi


resource "digitalocean_project_resources" "project-resource-leader" {
    project = var.project_id
    resources = [ local.leader_urn ]
}

resource "digitalocean_project_resources" "project-resources" {

    for_each = { for k, instance in digitalocean_droplet.instances: k => instance.urn }
    project = var.project_id
    resources = [ each.value ]
}
