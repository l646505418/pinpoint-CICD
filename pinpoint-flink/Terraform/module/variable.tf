variable "task_container_name" {
  default = "pinpoint-flink-taskmanager"
  type=string
}

variable "job_container_name" {
  default = "pinpoint-flink-jobmanager"
  type=string
}
variable "PINPOINT_FLINK_NAME" {
  default = "pinpoint-flink"
  type=string
}
variable "PINPOINT_ZOOKEEPER_ADDRESS" {
  default = "zookeeper"
  type=string
}