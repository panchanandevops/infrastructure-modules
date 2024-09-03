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
  type        = string
  default     = "us-east-1"
}

variable "enable_cluster_autoscaler" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_helm_verion" {
  description = "Cluster Autoscaler Helm verion"
  type        = string
  default     = "9.37.0"
}

variable "enable_metrics_server" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

variable "metrics_server_helm_verion" {
  description = "Cluster Autoscaler Helm verion"
  type        = string
  default     = "3.12.1"
}

variable "enable_aws_lbc" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

variable "aws_lbc_helm_verion" {
  description = "Cluster Autoscaler Helm verion"
  type        = string
  default     = "1.7.2"
}

variable "enable_external_nginx" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

variable "external_nginx_helm_verion" {
  description = "Cluster Autoscaler Helm verion"
  type        = string
  default     = "4.10.1"
}
