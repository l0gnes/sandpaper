
# region variables
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
# endregion

#region modules
# should import from terraform.tfvars in the root directory
module "cloud_run_svc" {
  source = "../../terraform/modules/cloud_run_svc"

  service_name = var.service_name
  gcp_location = var.gcp_location
  gcp_zone = var.gcp_zone
  gcp_project_id = var.gcp_project_id
}

module "iam_noauth" {
  source = "../../terraform/modules/iam_noauth"

  service_name = var.service_name
  gcp_location = var.gcp_location
  gcp_zone = var.gcp_zone
  gcp_project_id = var.gcp_project_id

  depends_on = [ module.cloud_run_svc ]
}
# endregion

# region system
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.15.0"
    }
  }

  backend "gcs" {
    bucket  = "tf-state-sandpaper"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_location
  zone    = var.gcp_zone
}
# endregion