terraform {
  source = "../../../infrastructure-modules/do/domain-record"
}

include {
  path = find_in_parent_folders()
}

dependency "domain" {
    config_path = "../../global/domain"
}

dependency "reserved-ip" {
  config_path = "../reserved-ip"
}

inputs = {
    domain = dependency.domain.outputs.id
    type = "A"
    name = "turisapps"
    ip = dependency.reserved-ip.outputs.ip_address
}