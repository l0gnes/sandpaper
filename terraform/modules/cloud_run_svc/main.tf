resource "google_cloud_run_v2_service" "default" {
  name     = var.service-name
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