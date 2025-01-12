terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.15.0"
    }
  }

  backend "gcs" {
    bucket  = "tf-state-sandpaper" # TODO: Modify this in the future for actual prod
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.gcp-project-id
  region  = var.gcp-location
  zone    = var.gcp-zone
}