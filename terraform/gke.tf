resource "google_container_cluster" "primary" {
  name               = "rails-cluster"
  zone               = "asia-northeast1-a"
  initial_node_count = 3

  node_config {
    machine_type = "n1-standard-1"
  }
}
