

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

resource "docker_container"  pinpoint-mysql{
  image = "pinpointdocker/pinpoint-mysql:${var.pinpoint_version}"
  name  = var.container_name
  hostname = var.host_name
  ports {
    internal = "3306"
    external = "3306"
  }
  env = ["MYSQL_ROOT_PASSWORD=${var.mysql_env.MYSQL_ROOT_PASSWORD}","MYSQL_USER=${var.mysql_env.MYSQL_USER}","MYSQL_PASSWORD=${var.mysql_env.MYSQL_PASSWORD}","MYSQL_DATABASE=${var.mysql_env.MYSQL_DATABASE}"]
}