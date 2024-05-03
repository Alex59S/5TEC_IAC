# Réservation d'une adresse IP externe statique
resource "google_compute_address" "static_ip" {
  name = "vm-static-ip"
  project = google_project.terra-effi-proj.project_id
  region  = "europe-west1"
  depends_on = [google_project_service.compute_api]
}

