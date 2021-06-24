variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

# variable "prefix" {
#     type = string
#     description = "GCP Resource Prefix"
# }

variable "region" {
  type        = string
  description = "GCP Region"
}

variable "gs_region" {
  type        = string
  description = "GCP Storage Region"
}

variable "service_account_name" {
  type        = string
  description = "GCP Service Account Name"
}

variable "bq_table_name" {
  type = string
  description = "Big Query Table Name"
}
# modified
variable "bq_table_name_two" {
  type = string
  description = "Big Query Table Name"
}


# variable "schemafile" {
#   default = "schema.json"
# }
