variable "env" {
  description = "Environment name."
  type        = string
}

variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

variable "region" {
  description = "Name of the aws region"
  type = string
  default = "us-east-1"
}