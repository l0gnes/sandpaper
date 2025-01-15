resource "google_cloud_run_v2_service" "default" {
  name     = var.service_name
  location = var.gcp_location
  deletion_protection = false
  ingress = "INGRESS_TRAFFIC_ALL"
  project = var.gcp_project_id

  template {
    containers {
      image = var.IMAGE_URL
    }
  }
}