# Création d'un compte de service
resource "google_service_account" "vm_service_account" {
  account_id   = "vm-service-account"
  display_name = "VM Service Account"
  project      = google_project.terra-effi-proj.project_id
}