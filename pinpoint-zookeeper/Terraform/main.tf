terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}



resource "docker_network" "private_network" {
  name = "pinpoint"
  driver="bridge"
}


resource "docker_container" "pinpoint-zookeeper-1" {
  image = "zookeeper:3.4.13"
  name = "zoo1"
  hostname = "pinpoint-zoo1"
  restart = "always"
  ports {
    internal = 2181
    external = 2181
  }
  ports {
    internal = 2888
  }
  ports {
    internal = 3888
  }
  networks_advanced {
    name="${docker_network.private_network.name}"
  }
  env=["ZOO_MY_ID=1","ZOO_SERVERS=server.1//=0.0.0.0:2888:3888 server.2//=zoo2:2888:3888 server.3//=zoo3:2888:3888"]
}


resource "docker_container" "pinpoint-zookeeper-2" {
  image = "zookeeper:3.4.13"
  name = "zoo2"
  hostname = "pinpoint-zoo2"
  restart = "always"
  ports {
    internal = 2181
    external = 2181
  }
  ports {
    internal = 2888
  }
  ports {
    internal = 3888
  }
  networks_advanced {
    name="${docker_network.private_network.name}"
  }
  env=["ZOO_MY_ID=2","ZOO_SERVERS=server.1//=0.0.0.0:2888:3888 server.2//=zoo2:2888:3888 server.3//=zoo3:2888:3888"]
}

resource "docker_container" "pinpoint-zookeeper-3" {
  image = "zookeeper:3.4.13"
  name = "zoo3"
  hostname = "pinpoint-zoo3"
  restart = "always"
  ports {
    internal = 2181
    external = 2181
  }
  ports {
    internal = 2888
  }
  ports {
    internal = 3888
  }
  networks_advanced {
    name="${docker_network.private_network.name}"
  }
  env=["ZOO_MY_ID=3","ZOO_SERVERS=server.1//=0.0.0.0:2888:3888 server.2//=zoo2:2888:3888 server.3//=zoo3:2888:3888"]
}
