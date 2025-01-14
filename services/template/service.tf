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

# should import from terraform.tfvars in the root directory
module "cloud_run_svc" {
  source = "../../terraform/modules/cloud_run_svc"

  service-name = var.service-name
  gcp-location = var.gcp-location
  gcp-zone = var.gcp-zone
  gcp-project-id = var.gcp-project-id
}

module "iam_noauth" {
  source = "../../terraform/modules/iam_noauth"

  service-name = var.service-name
  gcp-location = var.gcp-location
  gcp-zone = var.gcp-zone
  gcp-project-id = var.gcp-project-id

  depends_on = [ module.cloud_run_svc ]
}