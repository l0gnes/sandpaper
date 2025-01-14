
# region variables
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
# endregion

#region modules
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
  project = var.gcp-project-id
  region  = var.gcp-location
  zone    = var.gcp-zone
}
# endregion