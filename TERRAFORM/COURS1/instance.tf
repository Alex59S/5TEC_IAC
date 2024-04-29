# Création d'un VPC personnalisé
resource "google_compute_network" "custom_vpc" {
  name                    = "vpc-tp1"
  auto_create_subnetworks = false
}

# Création d'un sous-réseau dans le VPC personnalisé
resource "google_compute_subnetwork" "custom_subnet" {
  name          = "subnet1"
  region        = "europe-west1"
  network       = google_compute_network.custom_vpc.name
  ip_cidr_range = "10.0.0.0/24"
}

# Création d'un compte de service
resource "google_service_account" "vm_service_account" {
  account_id   = "vm-service-account"
  display_name = "VM Service Account"
}

# Réservation d'une adresse IP externe statique
resource "google_compute_address" "static_ip" {
  name = "vm-static-ip"
}

# Création d'une instance VM spot e2-micro
resource "google_compute_instance" "spot_vm" {
  name         = "tp1"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"


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
    email  = google_service_account.vm_service_account.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# Règle de firewall pour autoriser le trafic entrant sur le port 80 (HTTP)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.custom_vpc.name

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

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
