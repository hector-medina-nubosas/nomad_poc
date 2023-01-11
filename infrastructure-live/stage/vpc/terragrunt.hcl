terraform {
  source = "../../../infrastructure-modules/do/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    name = "Stage-VPC"
    region = "ams3"
    ip_range = "10.10.0.0/24"
}