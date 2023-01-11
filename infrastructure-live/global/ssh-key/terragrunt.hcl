terraform {
  source = "../../../infrastructure-modules/do/ssh-key"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    name = "SSH key hector.medina@nubosas.com"
    public-ssh-key-file = "id_ed25519.pub"
}