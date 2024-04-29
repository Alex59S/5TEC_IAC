resource "google_project" "terra-effi-proj" {
  provider = google
  
  name       = "terra-effi"
#  project_id = "terra-effi-${random_id.project_id_suffix.hex}"
  project_id = "terra-effi-415631"

  billing_account = "01B8B9-870CC9-818D26 "
}
/*
resource "random_id" "project_id_suffix" {
  byte_length = 4
}
*/
