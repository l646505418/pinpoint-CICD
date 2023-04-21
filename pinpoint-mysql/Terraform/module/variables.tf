variable "pinpoint_version" {
  default = "2.5.0"
  type=string
}

variable "container_name" {
  default = "pinpoint-mysql"
  type=string
}

variable "host_name" {
  default = "pinpoint-mysql"
  type=string
}

variable "mysql_env" {
  type = object({
    MYSQL_ROOT_PASSWORD    = string
    MYSQL_USER = string
    MYSQL_PASSWORD=string
    MYSQL_DATABASE=string
  })

  default = {
    MYSQL_ROOT_PASSWORD="root123"
    MYSQL_USER="admin"
    MYSQL_PASSWORD="admin"
    MYSQL_DATABASE="pinpoint"
  }
}