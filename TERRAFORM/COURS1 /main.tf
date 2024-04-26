# Définition du fournisseur GCP
provider "google" {
  project     = "vast-node-421513" 
  region      = "europe-west1" 
}

# Création d'un réseau VPC
resource "google_compute_network" "my_network" {
  name = "my-network"
}

