terraform {
  source = "../../../infrastructure-modules/do/domain"
}

include {
  path = find_in_parent_folders()
}


inputs = {
    name        = "hectormedina.es"
}
