# Règle de firewall pour autoriser le trafic entrant sur le port 80 (HTTP)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.custom_vpc.name
  project = google_project.terra-effi-proj.project_id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Règle de firewall pour autoriser le trafic entrant sur le port 22 (SSH)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom_vpc.name
  project = google_project.terra-effi-proj.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
