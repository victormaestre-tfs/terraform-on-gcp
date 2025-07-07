data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = "ubuntu-os-cloud" 
  family      = "ubuntu-minimal-2404-lts-amd64"
}

resource "google_compute_disk" "ubuntu" {
  name  = "pi-hole"
  size  = 30
  type  = "pd-balanced"
  zone  = "us-east1-c"
  image = data.google_compute_image.ubuntu.self_link
}

resource "google_compute_instance" "pi-hole" {
  name         = "pi-hole"
  machine_type = "e2-micro"

  
  boot_disk {
    initialize_params {
      source = google_compute_disk.ubuntu.name
    }
  }
  network_interface {
   subnetwork = "default"
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

}
