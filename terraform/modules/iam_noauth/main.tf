data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = var.gcp_location
  project     = var.gcp_project_id
  service     = var.service_name

  policy_data = data.google_iam_policy.noauth.policy_data
}