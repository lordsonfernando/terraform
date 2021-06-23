resource "random_string" "random" {
  length  = 10
  special = false
  number  = false
  lower   = true
  upper   = false
  #override_special = "/@£$"
}