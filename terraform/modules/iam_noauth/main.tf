data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = var.gcp-location
  project     = var.gcp-project-id
  service     = var.service-name

  policy_data = data.google_iam_policy.noauth.policy_data
}