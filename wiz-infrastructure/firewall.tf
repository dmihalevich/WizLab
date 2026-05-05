resource "google_compute_firewall" "mongodb_internal" {
  name    = "allow-mongodb-internal"
  network = "wiz3-495317"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = ["10.220.0.0/14"] # The GKE Pod range you identified earlier
  target_tags   = ["mongodb-server"]
}