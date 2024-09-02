variable "env" {
  description = "Environment name."
  type        = string
}

variable "eks_version" {
  description = "Desired Kubernetes master version."
  type        = string
}

variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

variable "endpoint_private_access" {
  description = "EKS endpoint private access"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "EKS endpoint public access"
  type        = bool
  default     = true
}

variable "subnet_ids" {
  description = "List of subnet IDs. Must be in at least two different availability zones."
  type        = list(string)
}

variable "authentication_mode" {
  description = "EKS authentication mode"
  type        = string
  default     = "API"
}

variable "bootstrap_cluster_creator_admin_permissions" {
  description = "EKS bootstrap cluster creator admin permissions"
  type        = bool
  default     = true
}

variable "node_iam_policies" {
  description = "List of IAM Policies to attach to EKS-managed nodes."
  type        = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }
}

variable "node_groups" {
  description = "EKS node groups"
  type        = map(any)
}

