terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "reactive-spring-sample" {
  name         = "reactive-spring-sample:latest"
  keep_locally = true
}

resource "docker_container" "reactive-spring-sample" {
  image = docker_image.reactive-spring-sample.image_id
  name  = "reactive-spring-sample"
  ports {
    internal = 8080
    external = 8000
  }
}
