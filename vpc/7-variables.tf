variable "env" {
  description = "Environment name."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR (Classless Inter-Domain Routing)."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)
}

variable "private_subnet_tags" {
  description = "Private subnet tags."
  type        = map(any)
}

variable "public_subnet_tags" {
  description = "Private subnet tags."
  type        = map(any)
}

variable "private_subnets" {
  description = "Map of CIDR ranges to availability zones for private subnets."
  type = map(string)
  default = {
    "10.0.0.0/19" = "us-east-1a"
    "10.0.32.0/19" = "us-east-1b"
  }
}

variable "public_subnets" {
  description = "Map of CIDR ranges to availability zones for public subnets."
  type = map(string)
  default = {
    "10.0.64.0/19" = "us-east-1a"
    "10.0.96.0/19" = "us-east-1b"
  }
}