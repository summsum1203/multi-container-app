terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_key_fingerprint" {
  description = "Fingerprint of the SSH key registered with DigitalOcean"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc3"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "todo_app" {
  name   = "todo-app-server"
  region = var.region
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"

  ssh_keys = [var.ssh_key_fingerprint]

  tags = ["todo-app", "production"]
}

output "server_ip" {
  description = "Public IP address of the todo-app server"
  value       = digitalocean_droplet.todo_app.ipv4_address
}
