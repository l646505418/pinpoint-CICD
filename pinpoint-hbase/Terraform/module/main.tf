

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

resource "docker_container"  pinpoint-hbase{
  image = "pinpointdocker/pinpoint-hbase:${var.pinpoint_version}"
  name  = var.container_name
    ports {
      internal = "2181"
      external = "2181"
    }
    ports {
      internal = "60000"
      external = "60000"
    }
    ports {
      internal = "16010"
      external = "16010"
    }
    ports {
      internal = "60020"
      external = "60020"
    }
    ports {
      internal = "16030"
      external = "16030"
    }
}