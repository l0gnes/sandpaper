# should import from terraform.tfvars in the root directory
variable "gcp-location" {}
variable "gcp-zone" {}
variable "gcp-project-id" {}
variable "IMAGE_URL" {
  type = string
  default = "us-central1-docker.pkg.dev/sandpaper-test/template/7805:latest"
}

resource "google_cloud_run_v2_service" "template" {
  name     = "template" # This needs to be renamed per-service
  location = var.gcp-location
  deletion_protection = false
  ingress = "INGRESS_TRAFFIC_ALL"
  project = var.gcp-project-id

  template {
    containers {
      image = var.IMAGE_URL
    }
  }
}