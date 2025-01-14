variable "gcp-location" {
    type = string
}

variable "gcp-zone" {
    type = string
}

variable "gcp-project-id" {
    type = string
}

variable "service-name" {
  type = string
}

variable "IMAGE_URL" {
  type = string
  default = "us-central1-docker.pkg.dev/sandpaper-test/template/7805:latest"
}