variable "region" {
  description = "GCP Region"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "service_account" {
  description = "Service Account 목록"
  type        = map(any)
}