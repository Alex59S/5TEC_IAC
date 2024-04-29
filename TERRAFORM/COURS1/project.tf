provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project" "terra-effi-proj" {
  name            = "EFFICOM-IAC"
  project_id      = var.project_id
  billing_account = "01B8B9-870CC9-818D26"
}
