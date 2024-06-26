resource "google_storage_bucket" "my-bucket" {
  name = "teste"
  project = "gcp-devops-427517"
  location = "US"
  force_destroy = true
  public_access_prevention = "enforced"
}
