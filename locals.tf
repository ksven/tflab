locals {
  student = "Svyatoslav-Kovilskiy"

  common_tags = {
    "Terraform" = "true"
    "Project"   = "epam-tf-lab"
    "Owner"     = local.student
  }
}
