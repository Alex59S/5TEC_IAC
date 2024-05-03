# Création d'une instance VM spot e2-micro
resource "google_compute_instance" "spot_vm" {
  name         = "tp1"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"
  project = google_project.terra-effi-proj.project_id


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.custom_subnet.name
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}