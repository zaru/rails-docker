provider "google" {
  credentials = "${file("terraform-gcp.json")}"
  project     = "rails-docker"
  region      = "asia-northeast1"
}
