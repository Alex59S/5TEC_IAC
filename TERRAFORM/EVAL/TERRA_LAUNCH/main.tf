terraform {
  required_providers {
    google = {
      version = "~> 5.21.0"
    }
  }

}

provider "google" {
  region      = "europe-west9"
}

resource "google_project" "my_project" {
  name       = "EFFICOM-IAC"
  project_id = "${var.project}-${random_string.lower.result}"
  billing_account = "01B8B9-870CC9-818D26"
  auto_create_network = false
}
