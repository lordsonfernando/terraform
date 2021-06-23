resource "google_storage_bucket" "dataflow" {
  name          = "${random_string.random.result}-storage"
  location      = "US"
  force_destroy = true
}