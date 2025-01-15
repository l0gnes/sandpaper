variable "gcp_location" {
    type = string
}

variable "gcp_zone" {
    type = string
}

variable "gcp_project_id" {
    type = string
}

variable "service_name" {
  type = string
}

variable "IMAGE_URL" {
  type = string
  default = "us-central1-docker.pkg.dev/sandpaper-test/template/7805:latest"
}