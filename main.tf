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