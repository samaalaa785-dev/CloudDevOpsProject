variable "aws_region" {
  description = "AWS region for the project"
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "Two availability zones for the EKS private and public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "kubernetes_version" {
  description = "Supported Kubernetes version for the EKS cluster"
  type        = string
}

variable "public_access_cidrs" {
  description = "Your public IP range allowed to access the EKS API"
  type        = list(string)
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS worker nodes"
  type        = list(string)
  default     = ["t3.small"]
}
