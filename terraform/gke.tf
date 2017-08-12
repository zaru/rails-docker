resource "google_container_cluster" "primary" {
  name               = "rails-cluster"
  zone               = "asia-northeast1-a"
  initial_node_count = 3

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    machine_type = "n1-standard-1"
  }
}
