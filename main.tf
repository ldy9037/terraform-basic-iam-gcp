terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.20.0"
    }
  }

  backend "gcs" {}

  required_version = ">= 1.1.7"
}

provider "google" {
  region = var.region
}

resource "google_service_account" "service_account_ec2_web" {
  account_id   = var.service_account_account_id
  display_name = var.service_account_display_name
  description  = var.service_account_description

  project = var.project_id
}