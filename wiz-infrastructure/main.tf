resource "google_container_cluster" "primary" {
  name     = "wiz-k8s-cluster"
  location = "us-central1-a"
  network  = "wiz3-495317"
  
  # FIX 1: Match the actual subnet to stop the replacement
  subnetwork = "private-subnet" 

  # FIX 2: Define the IP policy so Terraform doesn't try to "null" it
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.220.0.0/14"
    services_ipv4_cidr_block = "34.118.224.0/20"
  }

  # FIX 3: Match the networking mode
  networking_mode = "VPC_NATIVE"

  # FIX 4: Set the deletion protection (GCP defaults this to true now)
  deletion_protection = false # Set to true later for production!
}