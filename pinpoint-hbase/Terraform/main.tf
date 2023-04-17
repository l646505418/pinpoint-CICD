terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}



module "pinpoint-habse" {
  source = "./module"
  pinpoint_version = "2.5.0"
  container_name = "pinpoint-hbase"
}