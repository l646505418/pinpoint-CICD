

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}


resource "docker_network" flink-network {
  name = "pinpoint"
  driver = "bridge"
}


resource "docker_container"  pinpoint-flink-job-manager{
  image = "${var.PINPOINT_FLINK_NAME}-flink:dev"
  name  = var.job_container_name
  ports {
    internal = "8081"
    external = "8081"
  }
  networks_advanced {
    name = docker_network.flink-network.name
  }
  command = ["standalone-job","-p","1","pinpoint-flink-job.jar","-spring.profiles.active","release"]
  env = ["JOB_MANAGER_RPC_ADDRESS=pinpoint-flink-job-manager","PINPOINT_ZOOKEEPER_ADDRESS=${var.PINPOINT_ZOOKEEPER_ADDRESS}"]

}

resource "docker_container"  pinpoint-flink-task-manager{
  image = docker_container.pinpoint-flink-job-manager.image
  name  = var.task_container_name
  command = ["taskmanager"]
  env = ["JOB_MANAGER_RPC_ADDRESS=pinpoint-flink-job-manager"]
  ports {
    internal = "6121"
    external = "6121"
  }
  ports {
    internal = "6122"
    external = "6122"
  }
  ports {
    internal = "19994"
    external = "19994"
  }
  networks_advanced {
    name = docker_network.flink-network.name
  }
}