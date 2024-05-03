# Création d'un sous-réseau dans le VPC personnalisé
resource "google_compute_subnetwork" "custom_subnet" {
  name          = "subnet1"
  region        = "europe-west1"
  network       = google_compute_network.custom_vpc.name
  ip_cidr_range = "10.0.0.0/24"
  project       = google_project.terra-effi-proj.project_id
}