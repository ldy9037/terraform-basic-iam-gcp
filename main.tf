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
  count = length(var.service_account)

  account_id   = var.service_account[count.index].account_id
  display_name = var.service_account[count.index].display_name
  description  = var.service_account[count.index].description

  project = var.project_id
}

/*
module "service_account-iam-bindings" {
  source = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "7.4.1"

  service_accounts = [google_service_account.service_account_ec2_web.email]
  project          = var.project_id
  
  bindings = {
    "roles/cloudsql.client" = [
      "serviceAccount:${google_service_account.service_account_ec2_web.email}"
    ]

    "roles/dns.admin" = [
      "serviceAccount:${google_service_account.service_account_ec2_web.email}"
    ]

    "roles/logging.logWriter" = [
      "serviceAccount:${google_service_account.service_account_ec2_web.email}"
    ]

    "roles/monitoring.metricWriter" = [
      "serviceAccount:${google_service_account.service_account_ec2_web.email}"
    ]
  }
}
*/