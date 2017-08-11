resource "google_sql_database_instance" "master" {
  name = "rails-sql"
  region = "asia-northeast1"
  database_version = "MYSQL_5_6"
  settings {
    tier = "db-f1-micro"
    disk_size = 10
    disk_type = "PD_SSD"
    location_preference {
      zone = "asia-northeast1-a"
    }
  }
}
