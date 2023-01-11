terraform {
  source = "../../../infrastructure-modules/do/server"
}

include {
  path = find_in_parent_folders()
}

dependency "project" {
    config_path = "../project"
}

dependency "vpc" {
    config_path = "../vpc"
}

dependency "ssh-keys" {
    config_path = "../../global/ssh-key"
}

dependency "reserved-ip" {
    config_path = "../reserved-ip"
}

inputs = {
    config = {
        "leader" = {
            image = "debian-11-x64"
            size = "s-1vcpu-2gb"
            role = "server-client"
            leader = true
            public_ip = dependency.reserved-ip.outputs.ip_address
        },
        "client" = {
            image = "debian-11-x64"
            size = "s-1vcpu-2gb"
            role = "client"
        }
    }
   
    region = "ams3"
    vpc_id = dependency.vpc.outputs.id
    project_id = dependency.project.outputs.id
    ssh_keys_fingerprints = [ dependency.ssh-keys.outputs.fingerprint ]
}