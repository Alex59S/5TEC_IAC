resource "google_compute_instance_group" "webservers" {
  name        = "terraform-webservers"
  description = "Terraform instances"
  project = google_project.my_project.project_id

  instances = [
    google_compute_instance.default.id,
  ]

  named_port {
    name = "http"
    port = "80"
  }

  zone = "europe-west9-a"
}