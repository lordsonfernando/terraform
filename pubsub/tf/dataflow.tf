# POST /v1b3/projects/ashwinknaik-314910/locations/us-central1/templates:launch?gcsPath=gs://dataflow-templates-us-central1/latest/PubSub_to_BigQuery
# {
#     "jobName": "",
#     "environment": {
#         "bypassTempDirValidation": false,
#         "tempLocation": "gs://izp5w0bohm-sa/tmp",
#         "ipConfiguration": "WORKER_IP_UNSPECIFIED",
#         "additionalExperiments": []
#     },
#     "parameters": {
#         "inputTopic": "projects/ashwinknaik-314910/topics/izp5w0bohm-topic",
#         "outputTableSpec": "ashwinknaik-314910:izp5w0bohm_dataset.test"
#     }
# }

resource "google_dataflow_job" "pubsub_stream" {
  name                    = "${random_string.random.result}-dataflow-job1"
  template_gcs_path       = "gs://dataflow-templates-us-central1/latest/PubSub_to_BigQuery"
  temp_gcs_location       = "${google_storage_bucket.dataflow.url}/tmp"
  enable_streaming_engine = true
  service_account_email   = google_service_account.dataflow_sa.email
  parameters = {
    inputTopic      = google_pubsub_topic.topic1.id
    outputTableSpec = "${var.project_id}:${google_bigquery_dataset.dataset.dataset_id}.${google_bigquery_table.table.table_id}"
  }

  on_delete = "cancel"
}

# modified
resource "google_dataflow_job" "pubsub_stream_two" {
  name                    = "${random_string.random.result}-dataflow-job2"
  template_gcs_path       = "gs://dataflow-templates-us-central1/latest/PubSub_to_BigQuery"
  temp_gcs_location       = "${google_storage_bucket.dataflow.url}/tmp"
  enable_streaming_engine = true
  service_account_email   = google_service_account.dataflow_sa.email
  parameters = {
    inputTopic      = google_pubsub_topic.topic2.id
    outputTableSpec = "${var.project_id}:${google_bigquery_dataset.dataset.dataset_id}.${google_bigquery_table.table_two.table_id}"
  }

  on_delete = "cancel"
}