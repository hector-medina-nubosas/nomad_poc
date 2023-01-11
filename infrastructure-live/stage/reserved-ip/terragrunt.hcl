terraform {
  source = "../../../infrastructure-modules/do/reserved-ip"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    region = "ams3"
}