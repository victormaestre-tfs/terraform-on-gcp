resource "google_compute_network" "pi-hole" {
  name                    = "pi-hole"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "pi-hole" {
  name          = "pi-hole"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-east1"
  network       = google_compute_network.pi-hole.id
}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = "ubuntu-os-cloud" 
  family      = "ubuntu-minimal-2404-lts-amd64"
}

resource "google_compute_instance" "pi-hole" {
  name         = "pi-hole"
  machine_type = "e2-micro"
  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
      size = 30
    }
  }
  network_interface {
    subnetwork = "pi-hole"
    access_config {
      # Leave empty for dynamic public IP
    }
  }
}
