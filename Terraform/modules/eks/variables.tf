variable "project_name" {
  description = "Project name"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EKS"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) >= 2
    error_message = "EKS requires at least two private subnets."
  }
}

variable "node_instance_types" {
  description = "Worker node instance types"
  type        = list(string)
  default     = ["t3.small"]
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 2
}

variable "public_access_cidrs" {
  description = "CIDR ranges allowed to access the EKS public API endpoint"
  type        = list(string)
}
