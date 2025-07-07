variable "project_id" {
  type    = string 
  default = "terraform-on-gcp-461911"
}

variable "region" {
  type    = string
  region  = "us-east1"
}

variable "network_name" {
  type    = string
  default = "pi-hole"
}

variable "network_ip_range" {
  type    = string
  default = "10.2.0.0/16"
}

 variable "image_project" {
  type    = string
  default = "ubuntu-os-cloud" 
}

variable "image_family"  {
  type    = string
  default = "ubuntu-minimal-2404-lts-amd64" 
}

variable "image_family"  {
  type    = string
  default = "ubuntu-minimal-2404-lts-amd64" 
}

variable "instance_name"  {
  type    = string
  default = "pi-hole" 
}

variable "machine_type"  {
  type    = string
  default = "e2-micro" 
}
/*
resource "google_compute_firewall" "allow_dns_terraform" {
  name    = "allow-dns-terraform"
  network = google_compute_network.pi-hole.name

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  source_ranges = ["123.123.123.123/32"]
}*/
