terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.1"
        }
    }
}

variable "pr_key" {
    type = string
}

variable "host" {
    type = string
}

provider "docker" {
    host = var.host
    ssh_opts = ["-o", "IdentityFile=${var.pr_key}",
                "-o", "StrictHostKeyChecking=no",
                "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_image" "httpd" {
    name = "httpd"
    keep_locally = false
}

resource "docker_container" "httpd" {
    image = docker_image.httpd.image_id
    name = "tutorial"

    ports {
        internal = 80
        external = 8000
    }
}
