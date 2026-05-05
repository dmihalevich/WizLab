provider "google" {
  project = "wiz3-495317"
  region  = "us-central1"
  zone    = "us-central1-a"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}