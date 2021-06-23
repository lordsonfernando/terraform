# resource "google_pubsub_schema" "schema" {
#   name = "${random_string.random.result}-schema"
#   type = "AVRO"
#   definition = local.pubsubschema
# }

resource "google_pubsub_topic" "topic1" {
  name = "${random_string.random.result}-topic"
  # depends_on = [google_pubsub_schema.schema]
  # schema_settings {
  #   schema = google_pubsub_schema.schema.id
  #   encoding = "JSON"
  # }

}
# modified
resource "google_pubsub_topic" "topic2" {
  name = "${random_string.random.result}-topic2"
  # depends_on = [google_pubsub_schema.schema]
  # schema_settings {
  #   schema = google_pubsub_schema.schema.id
  #   encoding = "JSON"
  # }

}