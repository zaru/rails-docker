resource "google_sql_database_instance" "master" {
  name = "rails-sql4"
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

resource "google_sql_user" "users" {
  name     = "sql-user"
  instance = "${google_sql_database_instance.master.name}"
  host     = "%"
  password = "sql-password"
}
