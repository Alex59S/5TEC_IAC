resource "google_project_service" "compute_api" {
  project = google_project.terra-effi-proj.project_id
  service = "compute.googleapis.com"

  disable_on_destroy = false
}
