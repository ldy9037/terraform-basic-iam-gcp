variable "region" {
  description = "GCP Region"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "service_account_account_id" {
  description = "EC2 Webserver 용 service account ID"
  type        = string
}

variable "service_account_display_name" {
  description = "EC2 Webserver 용 display name"
  type        = string
}

variable "service_account_description" {
  description = "EC2 Webserver 용 description"
  type        = string
}