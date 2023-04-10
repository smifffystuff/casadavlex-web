variable "aws_region" {
  default = "eu-west-2"

}

variable "host_name" {
    default = "api"
}

variable "az_count" {
  default = 2
}

variable "app_ssl_port" {
  default = "443"
}

variable "app_port" {
  default = "80"
}

variable "ecs_task_execution_role" {
  default = "cadadavlex-eexecution-role"

}

variable "app_image" {
  default = "240400571745.dkr.ecr.eu-west-2.amazonaws.com/casadavlex-web"
}

variable "app_image_version" {
    default = "v1.1.2"
}

variable "app_count" {
  default = 2
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  default = "1024"
}

variable "fargate_memory" {
  default = "2048"
}

