# Création d'un VPC personnalisé
resource "google_compute_network" "custom_vpc" {
  name                    = "vpc-tp1"
  auto_create_subnetworks = false
  project                 = google_project.terra-effi-proj.project_id
  depends_on              = [google_project_service.compute_api]
}