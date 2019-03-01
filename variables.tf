variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "route53zone"    {}

variable "stage"     { default = "test" }
variable "clname"    { default = "test-ecs" }

variable "svcname"   { default = "nginx-service" }

variable "taskcount" { default = 1 }

variable "region"    { default = "eu-central-1" }

variable "health_check_path" {
  default = "/"
}

variable "app_image" {
  description = "Docker image to run"
  default     = "nginx/nginx:latest"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}
