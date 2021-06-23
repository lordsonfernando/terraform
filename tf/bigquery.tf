resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "${random_string.random.result}_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = var.gs_region
  #default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.bq_sa.email
  }

  access {
    role          = "OWNER"
    user_by_email = "ashwinknaik@google.com"
  }
}


resource "google_bigquery_table" "table" {
  dataset_id          = google_bigquery_dataset.dataset.dataset_id
  table_id            = var.bq_table_name
  deletion_protection = false

  schema = file("${path.module}/bigquery/table.schema")

}